import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

Widget checkWiki(String value) {
  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  return value == 'No wiki url'
      ? Text(
          value,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: valueTextStyle,
        )
      : TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(5),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            _launchURL(value);
          },
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: wikiTextStyle,
          ),
        );
}
