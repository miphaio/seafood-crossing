import 'package:flutter/material.dart';
import 'package:seafood_crossing/about/tiles/about.dart';
import 'package:seafood_crossing/about/tiles/account.dart';
import 'package:seafood_crossing/about/tiles/open-source.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class AboutIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText('seafood-crossing'),
      ),
      body: ListView(
        children: <Widget>[
          AccountAboutTile(),
          OpenSourceAboutTile(),
          AboutAboutTile(),
        ],
      ),
    );
  }
}
