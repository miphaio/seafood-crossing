import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class AboutAboutTile extends StatefulWidget {
  @override
  _AboutAboutTileState createState() => _AboutAboutTileState();
}

class _AboutAboutTileState extends State<AboutAboutTile> {
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
        leading: Icon(Icons.info_outline),
        title: coreLocalizations.getText('about'),
        children: <Widget>[
          ListTile(
            dense: true,
            title: coreLocalizations.getText('version-number'),
            subtitle: Text(this._version != null ? this._version : '...'),
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
