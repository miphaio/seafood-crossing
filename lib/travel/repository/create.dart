import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class CreateRepositoryResponse {
  final bool created;

  CreateRepositoryResponse({
    @required this.created,
  });
}

Future<CreateRepositoryResponse> createRepository({
  @required String title,
  @required String description,
  @required String accessCode,
}) async {
  final String target = joinPath(['dev', 'travel', 'destination', 'create']);

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
        'title': title,
        'description': description,
        'accessCode': accessCode,
      },
    );

    final String identifier = response.data['identifier'].toString();
    final String accountId = response.data['accountId'].toString();

    if (identifier.length < 5) {
      return null;
    }

    await UserInfo.update(identifier, accountId);

    return CreateRepositoryResponse(
      created: response.data['created'] as bool,
    );
  } catch (e) {
    return null;
  }
}
