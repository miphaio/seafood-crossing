import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/util/user-info.dart';

class AccountWrapper extends StatefulWidget {
  final Widget child;

  AccountWrapper({
    @required this.child,
  });

  @override
  _AccountWrapperState createState() => _AccountWrapperState();
}

class _AccountWrapperState extends State<AccountWrapper> {
  bool _accountAvailable;

  @override
  void initState() {
    super.initState();
    this.checkUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (this._accountAvailable == null) {
      return Container();
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
          onPressed: () async {
            await UserInfo.init();
            this.setState(() {
              this._accountAvailable = true;
            });
          },
        ),
      ],
    );
  }

  Future<void> checkUserInfo() async {
    final bool checkResult = await UserInfo.check();
    this.setState(() {
      this._accountAvailable = checkResult;
    });
  }
}
