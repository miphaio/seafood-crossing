import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

Future<String> openInputDialog(
  BuildContext context, {
  @required String title,
  @required String label,
}) async {
  String result = '';

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: label,
                ),
                onChanged: (String value) {
                  result = value;
                },
                onSubmitted: (String value) {
                  Navigator.of(context).pop(result);
                },
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: CoreLocalizations.of(context).getText('ok'),
            onPressed: () => Navigator.of(context).pop(result),
          ),
        ],
      );
    },
  );
}
