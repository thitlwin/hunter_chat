import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joy_app/src/feature/active_programs/presentation/provider/active_programs_provider.dart';
import 'package:joy_app/src/feature/chat/data/repository/hunter_chat_repository.dart';
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';
import 'package:joy_app/src/feature/chat/presentation/model/chat_screen_state.dart';
import 'package:joy_app/src/feature/chat/presentation/pages/hunter_chat_screen.dart';
import 'package:joy_app/src/feature/chat/util/chat_constant.dart';
import 'package:joy_app/src/feature/profile/presentation/provider/user_provider.dart';
import 'package:ntp/ntp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hunter_chat_screen_notifier.g.dart';

@riverpod
Stream<List<ChatMessageDomain>> chatMessagesStream(
    Ref ref, String documentName) {
  final repository = ref.watch(hunterChatRepositoryProvider);
  return repository
      .getHunterChatStream(documentName); // This is the real-time stream
}

@riverpod
class HunterChatScreenNotifier extends _$HunterChatScreenNotifier {
  @override
  Future<ChatScreenState> build(ChatEntry chatEntry, int? batchId) async {
    // Watch the user provider to get the current user.
    // By awaiting the future, this notifier will be in a loading state
    // until the user is fetched, and it will rebuild if the user changes.
    final currentUser = await ref.watch(userProvider.future);

    if (currentUser == null) {
      // If after loading, the user is still null, it means they are not logged in.
      // This is an unrecoverable error for a screen that requires a user.
      throw Exception('Authenticated user not found. Please log in again.');
    }
    final (documentName, chatTitle) =
        _getChatDocumentNameAndTitle(chatEntry, currentUser.id);

    // Fetch the initial page of messages (historical data)
    final repository = ref.read(hunterChatRepositoryProvider);
    final result = await repository.getHunterChat(documentName, lastDoc: null);

    // Set up the real-time stream listener AFTER the initial state is built
    _setupStreamListener(documentName);

    return result.fold(
      (failure) => throw failure, // Propagate error to AsyncError
      (messages) {
        final hasMore = messages.length >= ChatConstant.CHAT_PAGE_SIZE;
        return ChatScreenState.initial().copyWith(
          firebaseChatDocumentName: documentName,
          chatTitle: chatTitle,
          messages: messages,
          lastDocument: hasMore && messages.isNotEmpty
              ? messages.last.documentSnapshot
              : null,
          hasMore: hasMore,
          isLoading: false,
          currentUser: currentUser,
        );
      },
    );
  }

  (String, String) _getChatDocumentNameAndTitle(
      ChatEntry chatEntry, int authUserId) {
    if (chatEntry == ChatEntry.FromHome) {
      final documentName = 'admin-${authUserId}';
      return (documentName, "JOY Admin");
    } else if (chatEntry == ChatEntry.FromActiveChallenge) {
      final documentName = 'group-${batchId}';
      var title;
      if (batchId != null) {
        // get chat title
        final selectedChallengeAsyncValue =
            ref.watch(selectedActiveProgramProvider(batchId: batchId!));

        title = selectedChallengeAsyncValue.maybeWhen(
            data: (data) {
              return data.productTitle ?? "";
            },
            orElse: () => "Group Chat");
      }
      return (documentName, title);
    } else {
      throw Exception('Unknown chat entry type');
    }
  }

  // This method sets up the listener for real-time updates
  void _setupStreamListener(String documentName) {
    ref.listen<AsyncValue<List<ChatMessageDomain>>>(
      chatMessagesStreamProvider(documentName),
      (previous, next) {
        final newMessages = next.value; // Get the new messages from the stream
        final currentState =
            state.value; // Get the current state of the notifier

        // Only proceed if we have new messages from the stream and a valid current state
        if (newMessages == null ||
            newMessages.isEmpty ||
            currentState == null) {
          return;
        }

        // Create a set of existing message IDs for efficient duplicate checking
        final existingMessageIds =
            currentState.messages.map((m) => m.id).toSet();

        // Filter out messages that are already in our current state (e.g., from initial load or optimistic update)
        final uniqueNewMessages = newMessages
            .where((m) => !existingMessageIds.contains(m.id))
            .toList();

        if (uniqueNewMessages.isNotEmpty) {
          // Merge new unique messages at the beginning (assuming reverse chronological order)
          final updatedMessages = [
            ...uniqueNewMessages,
            ...currentState.messages
          ];
          state = AsyncValue.data(currentState.copyWith(
            messages: updatedMessages,
            // Preserve other UI-related state
            chatContent: currentState.chatContent,
            imageFiles: currentState.imageFiles,
            videoFiles: currentState.videoFiles,
            otherFiles: currentState.otherFiles,
          ));
        }
      },
    );
  }

  Future<void> submitMessage({required String chatContent}) async {
    final currentState = state.value;
    if (currentState == null) {
      return;
    }

    final hasText = chatContent.isNotEmpty;
    final hasFiles = (currentState.imageFiles?.isNotEmpty ?? false) ||
        (currentState.videoFiles?.isNotEmpty ?? false) ||
        (currentState.otherFiles?.isNotEmpty ?? false);
    if (!hasText && !hasFiles) {
      return; // No content to send
    }

    List<String> filePaths =
        (currentState.imageFiles ?? []).map((file) => file.path).toList();
    filePaths.addAll((currentState.videoFiles ?? []).map((file) => file.path));
    filePaths.addAll((currentState.otherFiles ?? []).map((file) => file.path));

    // Ensure currentUser is available before creating message
    if (currentState.currentUser == null) return; // Or throw an error
    // Use NTP to get the current time instead of relying on local device time
    DateTime ntpTime = await NTP.now();
    final messageDateTime = ntpTime; //.toIso8601String();

    final message =
        ChatMessageDomain.empty(messageDateTime: messageDateTime).copyWith(
      content: chatContent,
      user: ChatUserDomain(
        // Use currentUser from state
        id: currentState.currentUser!.id,
        name: currentState.currentUser!.name,
        profilePicture: currentState.currentUser!.profilePicture,
      ),
    );
    if (filePaths.isEmpty) {
      // If no files to upload, just send the message
      _sendMessage(message);
    } else {
      // Upload files and then send the message
      await _uploadFilesAndSendMessage(filePaths, message);
    }
  }

  void setImageFiles(List<XFile> files) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(currentState.copyWith(imageFiles: files));
  }

  void setVideoFiles(List<XFile> files) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(currentState.copyWith(videoFiles: files));
  }

  void setOtherFiles(List<XFile> files) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncValue.data(currentState.copyWith(otherFiles: files));
  }

  void removeVideoFile(XFile file) {
    final currentState = state.value;
    if (currentState == null) return;
    final currentVideos = currentState.videoFiles;
    if (currentVideos == null) return;
    final updatedVideos = List<XFile>.from(currentVideos)
      ..removeWhere((item) => item.path == file.path);
    state = AsyncValue.data(currentState.copyWith(videoFiles: updatedVideos));
  }

  void removeImageFile(XFile file) {
    final currentState = state.value;
    if (currentState == null) return;
    final currentImages = currentState.imageFiles;
    if (currentImages == null) return;
    final updatedImages = List<XFile>.from(currentImages)
      ..removeWhere((item) => item.path == file.path);
    state = AsyncValue.data(currentState.copyWith(imageFiles: updatedImages));
  }

  void removeOtherFile(XFile file) {
    final currentState = state.value;
    if (currentState == null) return;
    final currentOthers = currentState.otherFiles;
    if (currentOthers == null) return;
    final updatedOthers = List<XFile>.from(currentOthers)
      ..removeWhere((item) => item.path == file.path);
    state = AsyncValue.data(currentState.copyWith(otherFiles: updatedOthers));
  }

  void _sendMessage(ChatMessageDomain message) async {
    final currentState = state.value;
    if (currentState == null) return;

    final repository = ref.read(hunterChatRepositoryProvider);
    final result = await repository.sendHunterChat(
        currentState.firebaseChatDocumentName, message);

    result.fold(
      (failure) {
        state = AsyncValue.data(currentState.copyWith(
          messageKey: failure.errorMessage,
        ));
      },
      (_) {
        // OPTIMISTIC UPDATE:
        // Add new message to the beginning of the list (assuming reverse chronological order)
        // This makes the UI feel instantaneous. The stream from Firestore will
        // shortly push the canonical update, which will overwrite this optimistic one.
        // This is usually the desired behavior for a great user experience.
        final updatedMessages = [message, ...currentState.messages];
        // Update state with new ChatScreenState instance
        state = AsyncValue.data(currentState.copyWith(
          messages: updatedMessages, // Optimistic update
          isLoading: false,
          chatContent: '',
          imageFiles: null,
          videoFiles: null,
          otherFiles: null,
          messageKey: null,
          currentUser: currentState.currentUser,
        ));
      },
    );
  }

  Future<void> _uploadFilesAndSendMessage(
      List<String> filePaths, ChatMessageDomain message) async {
    final currentState = state.value;
    if (currentState == null) return;

    final repository = ref.read(hunterChatRepositoryProvider);
    final uploadResult =
        await repository.uploadChatAttachments(filePaths: filePaths);

    // Handle the result of the upload
    uploadResult.fold(
      (failure) => state = AsyncValue.data(currentState.copyWith(
          messageKey: failure.errorMessage, isLoading: false)),
      (fileUrls) {
        final messageWithFiles = message.copyWith(fileUrls: fileUrls);
        // After files are uploaded, send the message
        _sendMessage(messageWithFiles);
      },
    );
  }

  Future<void> loadMoreMessages() async {
    final currentState = state.value;
    // Prevent fetching if we are already loading, or if there are no more messages.
    if (currentState == null ||
        currentState.isLoading ||
        !currentState.hasMore) {
      return;
    }

    // Set loading state to true to show an indicator in the UI
    state = AsyncValue.data(currentState.copyWith(isLoading: true));

    final repository = ref.read(hunterChatRepositoryProvider);
    final result = await repository.getHunterChat(
        currentState.firebaseChatDocumentName,
        lastDoc: currentState.lastDocument);

    result.fold(
      (failure) {
        // On failure, update state with error and stop loading
        state = AsyncValue.data(currentState.copyWith(
            messageKey: failure.errorMessage, isLoading: false));
      },
      (newMessages) {
        final hasMore = newMessages.length >= ChatConstant.CHAT_PAGE_SIZE;
        state = AsyncValue.data(currentState.copyWith(
            isLoading: false,
            hasMore: hasMore,
            messages: [...currentState.messages, ...newMessages],
            lastDocument: hasMore && newMessages.isNotEmpty
                ? newMessages.last.documentSnapshot
                : currentState.lastDocument));
      },
    );
  }
}
