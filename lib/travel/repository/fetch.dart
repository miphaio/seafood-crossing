import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:seafood_crossing/common/repository/options.dart';
import 'package:seafood_crossing/travel/declare/category.dart';
import 'package:seafood_crossing/util/device-info.dart';
import 'package:seafood_crossing/util/path.dart';
import 'package:seafood_crossing/util/user-info.dart';

class FetchRepositoryElement {
  final String destinationId;
  final String accountId;
  final DestinationCategory category;
  final String title;
  final String description;
  final int occupanciesLength;
  final int reportLength;

  FetchRepositoryElement({
    @required this.destinationId,
    @required this.accountId,
    @required this.category,
    @required this.title,
    @required this.description,
    @required this.occupanciesLength,
    @required this.reportLength,
  });
}

Future<List<FetchRepositoryElement>> fetchRepository() async {
  final String target = joinPath(['travel', 'destination', 'fetch']);

  final DeviceInfo deviceInfo = await DeviceInfo.gather();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final UserInfo userInfo = await UserInfo.gather();

  try {
    Response response = await Dio(dioBaseOptions).post(
      target,
      data: {
        'version': packageInfo.version,
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
        category: DestinationCategory.from(element['category']),
        title: element['title'].toString(),
        description: element['description'].toString(),
        occupanciesLength: element['occupanciesLength'] as int,
        reportLength: element['reportLength'] as int,
      );
    }).toList();
  } on DioError catch (error) {
    print(error.response);
    return null;
  }
}
