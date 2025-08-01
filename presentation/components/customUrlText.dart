import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextStyle? urlStyle;
  final Function(String)? onHashTagPressed;

  const UrlText(
      {Key? key,
      required this.text,
      this.style,
      this.urlStyle,
      this.onHashTagPressed})
      : super(key: key);

  List<InlineSpan> getTextSpans() {
    List<InlineSpan> widgets = <InlineSpan>[];
    RegExp reg = RegExp(
        r"([#])\w+| [@]\w+|(https?|ftp|file|#)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*");
    Iterable<Match> _matches = reg.allMatches(text);
    List<_ResultMatch> resultMatches = <_ResultMatch>[];
    int start = 0;
    for (Match match in _matches) {
      if (match.group(0)!.isNotEmpty) {
        if (start != match.start) {
          _ResultMatch result1 = _ResultMatch();
          result1.isUrl = false;
          result1.text = text.substring(start, match.start);
          resultMatches.add(result1);
        }

        _ResultMatch result2 = _ResultMatch();
        result2.isUrl = true;
        result2.text = match.group(0)!;
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      _ResultMatch result1 = _ResultMatch();
      result1.isUrl = false;
      result1.text = text.substring(start);
      resultMatches.add(result1);
    }
    for (var result in resultMatches) {
      if (result.isUrl) {
        widgets.add(_LinkTextSpan(
            onHashTagPressed: onHashTagPressed,
            text: result.text,
            style: urlStyle ?? const TextStyle(color: Colors.blue)));
      } else {
        widgets.add(TextSpan(
            text: result.text,
            style: style ?? const TextStyle(color: Colors.black)));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: getTextSpans()),
        ),
      ],
    );
  }
}

class _LinkTextSpan extends TextSpan {
  final Function(String)? onHashTagPressed;
  _LinkTextSpan(
      {required TextStyle style, required String text, this.onHashTagPressed})
      : super(
            style: style,
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onHashTagPressed != null &&
                    (text.substring(0, 1).contains("#") ||
                        text.substring(0, 1).contains("#"))) {
                  onHashTagPressed(text);
                } else {
                  launchURL(text);
                }
              });
}

void launchURL(String url) async {
  if (url == "") {
    return;
  }
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } else {
    debugPrint('Could not launch $url');
  }
}

class _ResultMatch {
  late bool isUrl;
  late String text;
}
