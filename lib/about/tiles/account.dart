import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/external.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountAboutTile extends StatefulWidget {
  @override
  _AccountAboutTileState createState() => _AccountAboutTileState();
}

class _AccountAboutTileState extends State<AccountAboutTile> {
  String _version;

  @override
  void initState() {
    super.initState();
    this._initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Card(
      child: ExpansionTile(
        leading: Icon(Icons.verified_user),
        title: coreLocalizations.getText('account'),
        children: <Widget>[
          ListTile(
            dense: true,
            isThreeLine: true,
            title: coreLocalizations.getText('account-identifier'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                coreLocalizations.getText('visit'),
              ],
            ),
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
    );
  }

  Future<void> _initPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    this.setState(() {
      this._version = packageInfo.version;
    });
  }
}
