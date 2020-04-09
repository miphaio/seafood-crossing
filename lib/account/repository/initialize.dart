import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/common/repository/options.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class InitializeAccountRepositoryResponse {
  final String accountId;
  final String identifier;

  InitializeAccountRepositoryResponse({
    @required this.accountId,
    @required this.identifier,
  });
}

Future<InitializeAccountRepositoryResponse> initializeAccountRepository({
  @required String profileIdentifier,
}) async {
  final String target = joinPath(['account', 'initialize']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  try {
    Response response = await Dio(dioBaseOptions).post(
      target,
      data: {
        'version': packageInfo.version,
        'device': deviceInfo.toMap(),
        'profileIdentifier': profileIdentifier,
      },
    );

    final String identifier = response.data['identifier'].toString();
    final String accountId = response.data['accountId'].toString();

    if (identifier.length < 5) {
      return null;
    }

    await UserInfo.update(identifier, accountId);

    return InitializeAccountRepositoryResponse(
      accountId: accountId,
      identifier: identifier,
    );
  } on DioError catch (error) {
    print(error.response);
    return null;
  }
}
