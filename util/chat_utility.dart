import 'package:intl/intl.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';

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
}
