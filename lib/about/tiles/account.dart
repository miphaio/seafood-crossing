import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/user-info.dart';

class AccountAboutTile extends StatefulWidget {
  @override
  _AccountAboutTileState createState() => _AccountAboutTileState();
}

class _AccountAboutTileState extends State<AccountAboutTile> {
  String _identifier;
  bool _gathered = false;

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
          this._buildAccountIdentifier(),
        ],
      ),
    );
  }

  Widget _buildAccountIdentifier() {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    if (!this._gathered) {
      return ListTile(
        dense: true,
        title: coreLocalizations.getText('account-identifier'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            coreLocalizations.getText('loading'),
          ],
        ),
      );
    }

    if (this._identifier == null) {
      return ListTile(
        dense: true,
        title: coreLocalizations.getText('account-identifier'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            coreLocalizations.getText('account-identifier-not-exist'),
          ],
        ),
      );
    }

    return ListTile(
      dense: true,
      isThreeLine: true,
      title: coreLocalizations.getText('account-identifier'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this._identifier),
          coreLocalizations.getText('account-identifier-extend'),
        ],
      ),
    );
  }

  Future<void> _initIdentifier() async {
    UserInfo userInfo = await UserInfo.gather();
    this.setState(() {
      this._gathered = true;
      this._identifier = userInfo.identifier;
    });
  }
}
