import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/user-info.dart';

class AccountAboutTile extends StatefulWidget {
  @override
  _AccountAboutTileState createState() => _AccountAboutTileState();
}

class _AccountAboutTileState extends State<AccountAboutTile> {
  String _identifier;

  @override
  void initState() {
    super.initState();
    this._initIdentifier();
  }

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Card(
      child: ExpansionTile(
        leading: Icon(Icons.outlined_flag),
        title: coreLocalizations.getText('account'),
        children: <Widget>[
          ListTile(
            dense: true,
            isThreeLine: true,
            title: coreLocalizations.getText('account-identifier'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this._identifier != null ? this._identifier : '...'),
                coreLocalizations.getText('account-identifier-extend'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initIdentifier() async {
    UserInfo userInfo = await UserInfo.gather();
    this.setState(() {
      this._identifier = userInfo.identifier;
    });
  }
}
