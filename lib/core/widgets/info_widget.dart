import 'package:flutter/material.dart';
import 'package:responsive_web/core/model/device_info.dart';
import 'package:responsive_web/core/services/get_device_type.dart';

class InfoWidget extends StatelessWidget {
  final Widget Function(BuildContext context, MyDeviceInfo deviceInfo) builder;
  const InfoWidget({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        MediaQueryData mediaQuery = MediaQuery.of(context);
        MyDeviceInfo deviceInfo = MyDeviceInfo(
            orientation: mediaQuery.orientation,
            deviceType: Responsive().getDeviceType(mediaQueryData: mediaQuery),
            screenHeight: mediaQuery.size.height,
            screenWidth: mediaQuery.size.width,
            localHeight: constraints.maxHeight,
            localWidth: constraints.maxWidth);
        return builder(context, deviceInfo);
      },
    );
  }
}
