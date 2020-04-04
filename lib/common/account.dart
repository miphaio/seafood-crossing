import 'package:flutter/material.dart';
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
  bool _accountAvailable = false;

  @override
  void initState() {
    super.initState();
    this.checkUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (this._accountAvailable) {
      return widget.child;
    }
    return Container();
  }

  Future<void> checkUserInfo() async {
    final bool checkResult = await UserInfo.check();
    this.setState(() {
      this._accountAvailable = checkResult;
    });
  }
}
