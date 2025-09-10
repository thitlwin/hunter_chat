import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ChatUtility {
  static String getChatTime(DateTime? timestamp, AppLocalizations locale) {
    if (timestamp == null) return '';

    final DateTime now = DateTime.now().toLocal();
    final DateTime dt = timestamp.toLocal();

    // if (dt.isAfter(now)) {
    //   return DateFormat.jm().format(dt);
    // }

    final Duration diff = now.difference(dt);

    if (diff.inDays > 1) {
      return DateFormat.yMMMd().format(dt);
    } else if (diff.inDays == 1) {
      return locale.chatYesterday;
    } else if (diff.inHours > 0) {
      return locale.chatHrAgo(diff.inHours);
    } else if (diff.inMinutes > 0) {
      return locale.chatMinAgo(diff.inMinutes);
    } else if (diff.inSeconds > 0) {
      return locale.chatSecAgo(diff.inSeconds);
    } else {
      return locale.chatNow;
    }
  }

  static Future<String?> generateThumbnail(String videoUrl,
      {http.Client? httpClient}) async {
    try {
      // 1. Create temporary file paths for both the downloaded video and the thumbnail.
      final tempDir = await getTemporaryDirectory();
      final uniqueId = DateTime.now().millisecondsSinceEpoch;
      final videoFilePath = p.join(tempDir.path, '$uniqueId.mp4');
      final thumbFilePath = p.join(tempDir.path, '$uniqueId.webp');

      // 2. Download the video from the URL to the temporary file.
      final client = httpClient ?? http.Client();
      final response = await client.get(Uri.parse(videoUrl));
      if (response.statusCode != 200) {
        throw Exception('Failed to download video: ${response.statusCode}');
      }
      final videoFile = File(videoFilePath);
      await videoFile.writeAsBytes(response.bodyBytes);

      // 3. Generate a thumbnail from the LOCAL video file.
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoFilePath, // Use the local file path here
        thumbnailPath: thumbFilePath,
        imageFormat: ImageFormat.WEBP,
        maxHeight: 150,
        quality: 75,
      );

      // 4. Clean up the downloaded video file as it's no longer needed.
      await videoFile.delete();

      return thumbnailPath;
    } catch (e) {
      // Log the error for debugging purposes instead of crashing the app.
      debugPrint('=====>>> Failed to generate thumbnail for $videoUrl: $e');
      // Return null on failure. The UI can then handle this gracefully.
      return null;
    }
  }
}
