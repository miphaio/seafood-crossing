import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _Seafood_Crossing_Identifier = 'seafood-crossing-identifier';

class UserInfo {
  static Future<UserInfo> gather() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    final String identifier =
        preference.getString(_Seafood_Crossing_Identifier);

    if (identifier == null) {
      return UserInfo(
        identifier: 'new-user',
      );
    }

    return UserInfo(
      identifier: identifier,
    );
  }

  static Future<bool> check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String identifier =
        preferences.getString(_Seafood_Crossing_Identifier);
    return identifier != null;
  }

  static Future<UserInfo> update(String identifier) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_Seafood_Crossing_Identifier, identifier);
    return UserInfo(
      identifier: identifier,
    );
  }

  final String identifier;

  UserInfo({
    @required this.identifier,
  });
}
