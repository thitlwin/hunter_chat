import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joy_app/gen/assets.gen.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';
import 'package:joy_app/src/feature/chat/presentation/components/circular_image.dart';
import 'package:joy_app/src/feature/chat/presentation/components/customUrlText.dart';
import 'package:joy_app/src/feature/chat/util/chat_utility.dart';
import 'package:joy_app/src/router/app_routes.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessageDomain chat;
  final bool myMessage;
  final bool isChatWithAdmin;

  const ChatMessageWidget({
    super.key,
    required this.chat,
    required this.myMessage,
    required this.isChatWithAdmin,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment:
          myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment:
          myMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            if (!myMessage)
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: isChatWithAdmin
                    ? CircleAvatar(
                        backgroundImage:
                            Assets.icons.launcherIcon.image().image,
                      )
                    : CircleAvatar(
                        backgroundImage: customAdvanceNetworkImage(
                            chat.user?.profilePicture),
                      ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: myMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: myMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      right: myMessage ? 10 : (width / 4),
                      top: 20,
                      left: myMessage ? (width / 4) : 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getBorder(myMessage),
                        color: theme.colorScheme.surfaceDim,
                      ),
                      child: _buildMessageContent(context, theme),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.0,
                      right: myMessage ? 10.0 : 0,
                      left: myMessage ? 0 : 10.0,
                    ),
                    child: Text(
                      ChatUtility.getChatTime(chat.createdAt, locale),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            if (myMessage)
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: CircleAvatar(
                  backgroundImage:
                      customAdvanceNetworkImage(chat.user?.profilePicture),
                ),
              ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ],
    );
  }

  BorderRadius getBorder(bool myMessage) {
    return BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomRight:
          myMessage ? const Radius.circular(0) : const Radius.circular(20),
      bottomLeft:
          myMessage ? const Radius.circular(20) : const Radius.circular(0),
    );
  }

  Widget _buildMessageContent(BuildContext context, ThemeData theme) {
    final hasContent = chat.content != null && chat.content!.isNotEmpty;
    final hasFiles = chat.fileUrls != null && chat.fileUrls!.isNotEmpty;

    return Column(
      crossAxisAlignment:
          myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (hasFiles)
          GestureDetector(
            onTap: () {
              FullScreenImageViewerRoute(
                imageUrls: chat.fileUrls!,
                initialIndex: 0,
              ).push(context);
            },
            child: _buildAttachmentPreviews(context, chat.fileUrls!),
          ),
        if (hasContent)
          Padding(
            padding: EdgeInsets.only(top: hasFiles ? 8.0 : 0.0),
            child: UrlText(
              text: chat.content!,
              style: TextStyle(
                fontSize: 16,
                color: theme.colorScheme.onSurface,
              ),
              urlStyle: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }

  bool _isVideoUrl(String url) {
    final lowercasedUrl = url.toLowerCase();
    return lowercasedUrl.endsWith('.mp4') ||
        lowercasedUrl.endsWith('.mov') ||
        lowercasedUrl.endsWith('.avi') ||
        lowercasedUrl.endsWith('.mkv'); // Add other video formats as needed
  }

  Widget _buildAttachmentPreviews(BuildContext context, List<String> urls) {
    return Column(
      children: urls.map((url) {
        final isImage = _isImageUrl(url);
        final isVideo = _isVideoUrl(url);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: isImage || isVideo
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: url,
                        placeholder: (context, url) => Container(
                          height: 150,
                          color: Colors.grey[300],
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    if (isVideo)
                      const Icon(
                        Icons.play_circle_fill,
                        size: 50,
                        color: Colors.white70,
                      ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.insert_drive_file,
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        Uri.decodeFull(url.split('/').last.split('?').first),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
        );
      }).toList(),
    );
  }

  bool _isImageUrl(String url) {
    final lowercasedUrl = url.toLowerCase();
    return lowercasedUrl.endsWith('.png') ||
        lowercasedUrl.endsWith('.jpg') ||
        lowercasedUrl.endsWith('.jpeg') ||
        lowercasedUrl.endsWith('.gif') ||
        lowercasedUrl.endsWith('.webp');
  }
}
