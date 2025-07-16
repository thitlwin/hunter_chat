import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:joy_app/src/common_widgets/empty_state_widget.dart';
import 'package:joy_app/src/common_widgets/error_state_widget.dart';
import 'package:joy_app/src/feature/chat/presentation/components/chat_input_field.dart';
import 'package:joy_app/src/feature/chat/presentation/components/chat_message_widget.dart';
import 'package:joy_app/src/feature/chat/presentation/provider/hunter_chat_screen_notifier.dart';

enum ChatEntry { FromHome, FromActiveChallenge }

class HunterChatScreen extends StatefulHookConsumerWidget {
  final ChatEntry chatEntry;
  final int? batchId;
  const HunterChatScreen({
    super.key,
    required this.chatEntry,
    this.batchId,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HunterChatScreenState();
}

class _HunterChatScreenState extends ConsumerState<HunterChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    // Check if we are near the top (end of the list, for reverse: true)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final chatProvider = hunterChatScreenNotifierProvider(
        widget.chatEntry,
        widget.batchId,
      );
      final screenState = ref.read(chatProvider).value;

      // Only load more if there are more messages and not already loading
      if (screenState != null &&
          screenState.hasMore &&
          !screenState.isLoading) {
        final screenNotifier = ref.read(chatProvider.notifier);
        await screenNotifier.loadMoreMessages();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final chatProvider = hunterChatScreenNotifierProvider(
      widget.chatEntry,
      widget.batchId,
    );
    final screenState = ref.watch(chatProvider);

    ref.listen(chatProvider.select((s) => s.value?.messages.length),
        (previous, next) {
      // This listener triggers when the number of messages changes.
      // We only want to auto-scroll when the current user sends a message.
      if ((previous ?? 0) < (next ?? 0)) {
        final latestMessage = ref.read(chatProvider).value?.messages.first;
        final currentUser = ref.read(chatProvider).value?.currentUser;

        if (latestMessage != null &&
            currentUser != null &&
            latestMessage.user?.id == currentUser.id) {
          // A new message was added by the current user. Scroll to the top of the reversed list.
          // We use a short delay to ensure the ListView has rebuilt before we scroll.
          Future.delayed(const Duration(milliseconds: 50), () {
            if (_scrollController.hasClients) {
              _scrollController.animateTo(0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            }
          });
        }
      }
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              locale.title_chat,
              style: theme.textTheme.titleLarge,
            ),
            Text(
              screenState.value?.chatTitle ?? '',
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
      body: screenState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorStateWidget(
          title: locale.title_error,
          description: err.toString(),
          actionText: locale.try_again,
          onActionPressed: () => ref.invalidate(chatProvider),
        ),
        data: (state) => Column(
          children: <Widget>[
            // Message List
            Expanded(
              child: Builder(builder: (context) {
                if (state.messageKey != null) {
                  return ErrorStateWidget(
                      title: locale.title_error,
                      description: state.messageKey,
                      actionText: locale.try_again,
                      onActionPressed: () => ref.invalidate(chatProvider));
                }
                if (state.messages.isEmpty) {
                  return EmptyStateWidget(message: locale.empty_chat);
                }
                return ListView.builder(
                  reverse: true, // To start at the latest message
                  shrinkWrap: true,
                  physics:
                      const BouncingScrollPhysics(), // Add physics for better feel
                  controller:
                      _scrollController, // Attach scroll controller for pagination
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    final isMyMessage =
                        message.user?.id == state.currentUser?.id;
                    return ChatMessageWidget(
                      chat: message,
                      myMessage: isMyMessage,
                      isChatWithAdmin: ChatEntry.FromHome == widget.chatEntry,
                    );
                  },
                );
              }),
            ),
            const Divider(
              thickness: 0,
              height: 1,
            ),
            // Chat Input Field
            ChatInputField(
              chatEntry: widget.chatEntry,
              batchId: widget.batchId,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
