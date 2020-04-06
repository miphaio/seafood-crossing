import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/external.dart';
import 'package:seafood_crossing/util/path.dart';

class SupportAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Card(
      child: ExpansionTile(
        leading: Icon(Icons.help_outline),
        title: coreLocalizations.getText('support'),
        children: <Widget>[
          ListTile(
            dense: true,
            title: coreLocalizations.getText('post-github-issue'),
            subtitle: coreLocalizations.getText('visit'),
            onTap: () => launchUrl(context, seafoodCrossingGithubIssuesUrl),
          ),
          ListTile(
            dense: true,
            title: coreLocalizations.getText('send-email'),
            subtitle: Text('support@mipha.io'),
            onTap: () => launchUrl(context, sendEmailUrl),
          ),
        ],
      ),
    );
  }
}
