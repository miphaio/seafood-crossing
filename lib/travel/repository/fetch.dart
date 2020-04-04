import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class FetchRepositoryResponse {
  final bool created;

  FetchRepositoryResponse({
    @required this.created,
  });
}

Future<FetchRepositoryResponse> fetchRepository({
  @required String title,
  @required String description,
  @required String accessCode,
}) async {
  final String target = joinPath(['dev', 'travel', 'destination', 'create']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final UserInfo userInfo = await UserInfo.gather();

  try {
    Response response = await Dio().post(
      target,
      data: {
        'identifier': userInfo.identifier,
        'device': deviceInfo.toMap(),
        'title': title,
        'description': description,
        'accessCode': accessCode,
      },
    );

    return FetchRepositoryResponse(
      created: response.data['created'] as bool,
    );
  } catch (e) {
    return null;
  }
}
