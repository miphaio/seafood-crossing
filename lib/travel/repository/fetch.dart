import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class FetchRepositoryElement {
  final String destinationId;
  final String accountId;
  final String title;
  final String description;
  final String accessCode;
  final int occupanciesLength;
  final int reportLength;

  FetchRepositoryElement({
    @required this.destinationId,
    @required this.accountId,
    @required this.title,
    @required this.description,
    @required this.accessCode,
    @required this.occupanciesLength,
    @required this.reportLength,
  });
}

Future<List<FetchRepositoryElement>> fetchRepository() async {
  final String target = joinPath(['dev', 'travel', 'destination', 'fetch']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final UserInfo userInfo = await UserInfo.gather();

  try {
    Response response = await Dio().post(
      target,
      data: {
        'identifier': userInfo.identifier,
        'device': deviceInfo.toMap(),
      },
    );

    final String identifier = response.data['identifier'].toString();
    final String accountId = response.data['accountId'].toString();

    if (identifier.length < 5) {
      return null;
    }

    await UserInfo.update(identifier, accountId);

    final List<dynamic> elements = response.data['destinations'];
    return elements.map((dynamic element) {
      return FetchRepositoryElement(
        destinationId: element['destinationId'].toString(),
        accountId: element['accountId'].toString(),
        title: element['title'].toString(),
        description: element['description'].toString(),
        accessCode: element['accessCode'].toString(),
        occupanciesLength: element['occupanciesLength'] as int,
        reportLength: element['reportLength'] as int,
      );
    }).toList();
  } catch (e) {
    print(e);
    return null;
  }
}
