import 'package:language_hunter_app/src/feature/hunter_chat/data/repository/hunter_chat_repository.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/util/chat_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/domain/model/chat_message.dart';

part 'hunter_chat_provider.g.dart';

@riverpod
class HunterChat extends _$HunterChat {
  List<ChatMessage?> _messages = [];
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;
  late String _documentName;

  @override
  Future<List<ChatMessage?>> build(String documentName) async {
    _documentName = documentName;
    _messages = [];
    _lastDocument = null;
    _hasMore = true;
    return fetchMessages(documentName);
  }

  Future<List<ChatMessage?>> fetchMessages(String documentName) async {
    if (!_hasMore) return _messages; // Stop fetching if no more messages

    final repository = ref.read(hunterChatRepositoryProvider);
    final result =
        await repository.getHunterChat(documentName, lastDoc: _lastDocument);

    return result.fold(
      (failure) => throw Exception(failure.toString()), // Handle errors
      (newMessages) {
        if (newMessages.isEmpty ||
            newMessages.length < ChatConstant.CHAT_PAGE_SIZE) {
          _hasMore = false; // No more messages to load
        } else {
          _lastDocument =
              newMessages.last!.documentSnapshot; // Track last message
          _messages.addAll(newMessages);
        }
        return _messages;
      },
    );
  }

  Future<void> loadMoreMessages(String documentName) async {
    state = await AsyncValue.guard(() => fetchMessages(documentName));
  }

  Future<void> submitMessage(ChatMessage message) async {
    final repository = ref.read(hunterChatRepositoryProvider);
    final result = await repository.sendHunterChat(_documentName, message);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (_) {
        // Add new message to the beginning of the list (assuming reverse chronological order)
        _messages.insert(0, message);
        // Update state with new list instance
        state = AsyncValue.data(List.from(_messages));
      },
    );
  }
}
