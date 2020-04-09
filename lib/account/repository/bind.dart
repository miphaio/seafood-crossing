import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/common/repository/options.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class BindAccountRepositoryResponse {
  final String accountId;
  final String identifier;

  BindAccountRepositoryResponse({
    @required this.accountId,
    @required this.identifier,
  });
}

Future<BindAccountRepositoryResponse> bindAccountRepository({
  @required String identifier,
}) async {
  final String target = joinPath(['account', 'bind']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  try {
    Response response = await Dio(dioBaseOptions).post(
      target,
      data: {
        'version': packageInfo.version,
        'device': deviceInfo.toMap(),
        'identifier': identifier,
      },
    );

    final String responseIdentifier = response.data['identifier'].toString();
    final String accountId = response.data['accountId'].toString();

    if (responseIdentifier.length < 5) {
      return null;
    }

    await UserInfo.update(responseIdentifier, accountId);

    return BindAccountRepositoryResponse(
      accountId: accountId,
      identifier: responseIdentifier,
    );
  } on DioError catch (error) {
    print(error.response);
    return null;
  }
}
