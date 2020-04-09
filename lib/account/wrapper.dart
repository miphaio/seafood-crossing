import 'package:flutter/material.dart';
import 'package:seafood_crossing/account/initialize.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/user-info.dart';

class AccountWrapper extends StatefulWidget {
  final Widget child;
  final Widget placeholder;

  AccountWrapper({
    @required this.child,
    this.placeholder,
  });

  @override
  _AccountWrapperState createState() => _AccountWrapperState();
}

class _AccountWrapperState extends State<AccountWrapper> {
  bool _accountAvailable;

  @override
  void initState() {
    super.initState();
    this._checkUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (this._accountAvailable == null) {
      if (widget.placeholder == null) {
        return Container();
      }
      return widget.placeholder;
    }

    if (this._accountAvailable) {
      return widget.child;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.info),
            title:
                CoreLocalizations.of(context).getText('first-time-using-title'),
            subtitle: CoreLocalizations.of(context)
                .getText('first-time-using-subtitle'),
          ),
        ),
        RaisedButton(
          child: CoreLocalizations.of(context).getText('start-using'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return InitializeAccount();
                },
              ),
            ).whenComplete(this._checkUserInfo);
          },
        ),
      ],
    );
  }

  Future<void> _checkUserInfo() async {
    final bool checkResult = await UserInfo.check();
    this.setState(() {
      this._accountAvailable = checkResult;
    });
  }
}
