import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class VisitRepositoryResponse {
  final bool succeed;
  final String accessCode;

  VisitRepositoryResponse({
    @required this.succeed,
    @required this.accessCode,
  });
}

Future<VisitRepositoryResponse> visitRepository({
  @required String destinationId,
}) async {
  final String target = joinPath(['travel', 'destination', 'visit']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final UserInfo userInfo = await UserInfo.gather();

  try {
    Response response = await Dio().post(
      target,
      data: {
        'version': packageInfo.version,
        'identifier': userInfo.identifier,
        'device': deviceInfo.toMap(),
        'destinationId': destinationId,
      },
    );

    final String identifier = response.data['identifier'].toString();
    final String accountId = response.data['accountId'].toString();

    if (identifier.length < 5) {
      return null;
    }

    await UserInfo.update(identifier, accountId);

    return VisitRepositoryResponse(
      succeed: response.data['succeed'] as bool,
      accessCode: response.data['accessCode'].toString(),
    );
  } catch (e) {
    return null;
  }
}
