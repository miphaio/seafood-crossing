import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:url_launcher/url_launcher.dart';

String getPath() {
  if (kReleaseMode) {
    return 'https://7x9f1hfqp0.execute-api.us-east-1.amazonaws.com/prod';
  }
  if (Platform.isAndroid) {
    return 'http://10.0.2.2:4000/devl';
  }
  return 'http://localhost:4000/devl';
}

String joinPath(List<String> paths) {
  return getPath() + '/' + paths.join('/');
}

Future<void> launchUrl(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CoreLocalizations.of(context).getText('unable-to-launch-url'),
          // spell-checker:disable-next-line
          content: Text('nocookie.net'),
        );
      },
    );
  }
}
