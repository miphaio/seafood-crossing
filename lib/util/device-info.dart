import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/widgets.dart';

class DeviceInfo {
  static Future<DeviceInfo> gather() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await deviceInfo.androidInfo;

        return DeviceInfo(
          name: info.model,
          model: info.model,
          matcher: info.androidId,
        );
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await deviceInfo.iosInfo;

        return DeviceInfo(
          name: info.name,
          model: info.model,
          matcher: info.identifierForVendor,
        );
      }
    } on Exception {
      return null;
    }
    return null;
  }

  final String name;
  final String model;
  final String matcher;

  DeviceInfo({
    @required this.name,
    @required this.model,
    @required this.matcher,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': this.name,
      'model': this.model,
      'matcher': this.matcher,
    };
    return map;
  }

  String toString() {
    return this.toMap().toString();
  }
}
