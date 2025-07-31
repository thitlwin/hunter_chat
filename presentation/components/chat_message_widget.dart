import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joy_app/gen/assets.gen.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:joy_app/src/common_widgets/screenoverlay_loading_widget.dart';
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';
import 'package:joy_app/src/feature/chat/presentation/components/circular_image.dart';
import 'package:joy_app/src/feature/chat/presentation/components/customUrlText.dart';
import 'package:joy_app/src/feature/chat/presentation/components/video_preview_widget.dart';
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
        if (hasFiles) _buildAttachmentPreviews(context, chat.fileUrls!),
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
    final imageUrls = urls.where((url) => _isImageUrl(url)).toList();
    final otherUrls = urls.where((url) => !_isImageUrl(url)).toList();

    final List<Widget> attachmentWidgets = [];

    if (imageUrls.isNotEmpty) {
      if (imageUrls.length > 1) {
        // If the urls is image type, display image in grid view
        attachmentWidgets.add(
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final url = imageUrls[index];
              return GestureDetector(
                onTap: () {
                  if (chat.isUploading) return;
                  FullScreenImageViewerRoute(
                    imageUrls: imageUrls,
                    initialIndex: index,
                  ).push(context);
                },
                child: _buildImage(url),
              );
            },
          ),
        );
      } else {
        final url = imageUrls.first;
        attachmentWidgets.add(GestureDetector(
          onTap: () {
            if (chat.isUploading) return;
            FullScreenImageViewerRoute(
              imageUrls: imageUrls,
              initialIndex: 0,
            ).push(context);
          },
          child: _buildImage(url),
        ));
      }
    }

    for (final url in otherUrls) {
      if (_isVideoUrl(url)) {
        attachmentWidgets.add(
          GestureDetector(
            onTap: () {
              if (chat.isUploading) return;
              VideoPlayerRoute(videoUrl: url).push(context);
            },
            child: VideoPreviewWidget(url: url),
          ),
        );
      } else {
        // Other file types
        attachmentWidgets.add(_buildOtherFile(context, url));
      }
    }

    return Stack(children: [
      Column(
        children: attachmentWidgets.map((widget) => widget).toList(),
      ),
      if (chat.isUploading)
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: screenOverlayLoadingWidget()),
    ]);
  }

  ClipRRect _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: chat.isUploading
          ? _showLocalImage(localFilePath: url)
          : CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
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

  Widget _buildOtherFile(BuildContext context, String url) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.insert_drive_file,
            color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            Uri.decodeFull(url.split('/').last.split('?').first),
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  _showLocalImage({required String localFilePath}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.file(
        File(localFilePath),
        fit: BoxFit.cover,
      ),
    );
  }
}
