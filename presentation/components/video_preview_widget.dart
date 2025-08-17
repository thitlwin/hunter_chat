import 'dart:io';

import 'package:flutter/material.dart';
import 'package:joy_app/src/feature/chat/util/chat_utility.dart';

class VideoPreviewWidget extends StatefulWidget {
  final String url;
  final double height;

  const VideoPreviewWidget({
    super.key,
    required this.url,
    this.height = 150,
  });

  @override
  State<VideoPreviewWidget> createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  Future<String?>? _thumbnailFuture;

  @override
  void initState() {
    super.initState();
    _thumbnailFuture = ChatUtility.generateThumbnail(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FutureBuilder<String?>(
            future: _thumbnailFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  // If we have a thumbnail, display it from the local file.
                  return Image.file(
                    File(snapshot.data!),
                    height: widget.height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildErrorWidget(),
                  );
                }
                // If thumbnail generation failed, show an error icon.
                return _buildErrorWidget();
              }
              // While the thumbnail is generating, show a placeholder.
              return _buildPlaceholder();
            },
          ),
        ),
        const Positioned.fill(
          child: Icon(Icons.play_circle_fill, size: 50, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() => Container(
      height: 150,
      color: Colors.grey[300],
      child: const Center(child: CircularProgressIndicator()));

  Widget _buildErrorWidget() => Container(
      height: 150,
      color: Colors.black,
      child: const Icon(Icons.videocam, color: Colors.white));
}
