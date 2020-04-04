import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static Future<UserInfo> gather() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    final String identifier =
        preference.getString('seafood-crossing-identifier');

    return UserInfo(
      identifier: identifier,
    );
  }

  final String identifier;

  UserInfo({
    @required this.identifier,
  });
}
