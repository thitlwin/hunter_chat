import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
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

  static Future<String?> generateThumbnail(String videoUrl) async {
    try {
      // Generate a thumbnail from the video URL and store it locally.
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoUrl,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight: 150,
        quality: 75,
      );
      return thumbnailPath;
    } catch (e) {
      debugPrint('=====>>> Failed to generate thumbnail for $videoUrl: $e');
      // Return null on failure, which will be handled by the FutureBuilder.
      return null;
    }
  }
}
