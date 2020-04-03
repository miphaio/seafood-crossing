import 'package:flutter/material.dart';

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
                decoration: new InputDecoration(labelText: label),
                onChanged: (value) => result = value,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(result),
          ),
        ],
      );
    },
  );
}
