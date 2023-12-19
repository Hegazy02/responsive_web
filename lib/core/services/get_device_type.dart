import 'package:flutter/material.dart';
import 'package:responsive_web/core/enums/device_type.dart';

class Responsive {
  MyDeviceType getDeviceType({required MediaQueryData mediaQueryData}) {
    double width = mediaQueryData.size.width;
    Orientation orientation = mediaQueryData.orientation;
    print("width before $width");

    if (orientation == Orientation.landscape) {
      width = mediaQueryData.size.height;
      print("width $width");
    }
    if (width >= 950) {
      return MyDeviceType.desktop;
    } else if (width >= 600) {
      return MyDeviceType.tablet;
    } else {
      return MyDeviceType.mobile;
    }
  }
}
