import 'package:flutter/material.dart';
import 'package:responsive_web/core/enums/device_type.dart';

class MyDeviceInfo {
  final Orientation orientation;
  final MyDeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;
  MyDeviceInfo(
      {required this.orientation,
      required this.deviceType,
      required this.screenHeight,
      required this.screenWidth,
      required this.localHeight,
      required this.localWidth});
}
