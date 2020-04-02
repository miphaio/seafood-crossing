import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/external.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Card(
            child: ExpansionTile(
              leading: Icon(Icons.code),
              title: coreLocalizations.getText('open-source'),
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: coreLocalizations.getText('github'),
                  subtitle: coreLocalizations.getText('visit'),
                  onTap: () async {
                    if (await canLaunch(seafoodCrossingGithubUrl)) {
                      await launch(seafoodCrossingGithubUrl);
                    } else {
                      print('123');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
