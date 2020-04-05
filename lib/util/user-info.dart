import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _Seafood_Crossing_Identifier = 'seafood-crossing-identifier';
const String _Seafood_Crossing_Account_Id = 'seafood-crossing-account-id';

class UserInfo {
  static Future<UserInfo> gather() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    final String identifier =
        preference.getString(_Seafood_Crossing_Identifier);
    final String accountId = preference.getString(_Seafood_Crossing_Account_Id);

    if (identifier == null) {
      return UserInfo(
        identifier: 'new-user',
        accountId: accountId,
      );
    }

    return UserInfo(
      identifier: identifier,
      accountId: accountId,
    );
  }

  static Future<UserInfo> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_Seafood_Crossing_Identifier, 'new-user');

    return UserInfo(
      identifier: 'new-user',
      accountId: null,
    );
  }

  static Future<bool> check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String identifier =
        preferences.getString(_Seafood_Crossing_Identifier);
    return identifier != null;
  }

  static Future<UserInfo> update(String identifier, String accountId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_Seafood_Crossing_Identifier, identifier);
    await preferences.setString(_Seafood_Crossing_Account_Id, accountId);

    return UserInfo(
      identifier: identifier,
      accountId: accountId,
    );
  }

  final String identifier;
  final String accountId;

  UserInfo({
    @required this.identifier,
    @required this.accountId,
  });
}
