import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:joy_app/src/feature/chat/presentation/pages/hunter_chat_screen.dart';
import 'package:joy_app/src/feature/chat/presentation/provider/hunter_chat_screen_notifier.dart';
import 'package:joy_app/src/feature/news_feed/presentation/components/feed_attachment_picker.dart';
import 'package:joy_app/src/feature/news_feed/presentation/components/file_thumbnail_preview_list.dart';
import 'package:joy_app/src/feature/news_feed/presentation/components/media_preview_widget.dart';

class ChatInputField extends ConsumerStatefulWidget {
  const ChatInputField({super.key, required this.chatEntry, this.batchId});
  final ChatEntry chatEntry;
  final int? batchId;

  @override
  ConsumerState<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends ConsumerState<ChatInputField> {
  late final TextEditingController _messageController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _focusNode = FocusNode();
    // Add a listener to trigger a local rebuild when text changes,
    // so we can update the send button's enabled state without
    // involving the global notifier.
    _messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final screenNotifier = ref.read(
        hunterChatScreenNotifierProvider(widget.chatEntry, widget.batchId)
            .notifier);
    screenNotifier.submitMessage(chatContent: _messageController.text);
    _messageController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context);
    final screenNotifier = ref.read(
        hunterChatScreenNotifierProvider(widget.chatEntry, widget.batchId)
            .notifier);

    final screenState = ref
        .watch(
            hunterChatScreenNotifierProvider(widget.chatEntry, widget.batchId))
        .requireValue;

    final hasText = _messageController.text.isNotEmpty;
    final isSendButtonEnabled = hasText ||
        (screenState.imageFiles?.isNotEmpty ?? false) ||
        (screenState.videoFiles?.isNotEmpty ?? false) ||
        (screenState.otherFiles?.isNotEmpty ?? false);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Divider(
            thickness: 0,
            height: 1,
          ),
          // Comment input field
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 4, left: 16, right: 16),
            child: AbsorbPointer(
              absorbing: screenState.isLoading,
              child: Column(children: [
                const SizedBox(height: 8),
                TextFormField(
                  focusNode: _focusNode,
                  keyboardType: TextInputType.text,
                  controller: _messageController,
                  enabled: !screenState.isLoading,
                  decoration: InputDecoration(
                    hintText: locale.type_a_message,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    suffixIcon: screenState.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2.0),
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.send,
                                color: isSendButtonEnabled
                                    ? theme.colorScheme.secondary
                                    : theme.disabledColor),
                            onPressed:
                                isSendButtonEnabled ? _handleSubmit : null,
                          ),
                  ),
                  onFieldSubmitted: (s) =>
                      isSendButtonEnabled ? _handleSubmit() : null,
                  maxLines: null,
                ),
              ]),
            ),
          ),
          // display selected images comment
          if (screenState.imageFiles != null &&
              screenState.imageFiles!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Opacity(
                opacity: screenState.isLoading ? 0.5 : 1.0,
                child: AbsorbPointer(
                  absorbing: screenState.isLoading,
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: screenState.imageFiles!.length,
                      itemBuilder: (context, index) {
                        final file = screenState.imageFiles![index];
                        return MediaPreviewWidget(
                          file: file,
                          isVideo: false,
                          onRemove: () => screenNotifier.removeImageFile(file),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          // display selected videos comment
          if (screenState.videoFiles != null &&
              screenState.videoFiles!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Opacity(
                opacity: screenState.isLoading ? 0.5 : 1.0,
                child: AbsorbPointer(
                  absorbing: screenState.isLoading,
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final file = screenState.videoFiles![index];
                        return MediaPreviewWidget(
                          file: file,
                          isVideo: true,
                          onRemove: () => screenNotifier.removeVideoFile(file),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: screenState.videoFiles!.length,
                    ),
                  ),
                ),
              ),
            ),
          // display selected other files comment
          if (screenState.otherFiles != null &&
              screenState.otherFiles!.isNotEmpty)
            FileThumbnailPreviewList(
              files: screenState.otherFiles!,
              isLoading: screenState.isLoading,
              onRemoveFile: (f) => screenNotifier.removeOtherFile(f),
            ),
          Opacity(
            opacity: screenState.isLoading ? 0.5 : 1.0,
            child: AbsorbPointer(
              absorbing: screenState.isLoading,
              child: NewsFeedAttachmentPicker(
                isMultiSelect: false,
                onSelectImage: (xFile) => screenNotifier.setImageFiles([xFile]),
                onSelectMultiImages: (list) =>
                    screenNotifier.setImageFiles(list),
                onSelectVideo: (xFile) => screenNotifier.setVideoFiles([xFile]),
                onSelectMultiVideos: (list) =>
                    screenNotifier.setVideoFiles(list),
              ),
            ),
          )
        ],
      ),
    );
  }
}
