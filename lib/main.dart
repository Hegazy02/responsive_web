import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_web/core/enums/device_type.dart';
import 'package:responsive_web/core/services/get_device_type.dart';
import 'package:responsive_web/core/widgets/info_widget.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage2(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    print("xx $screenHeight");
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.greenAccent,
        height: screenHeight / 2,
        width: 500,
        child: Center(child: InfoWidget(
          builder: (context, deviceInfo) {
            return Container(
              color: Colors.black,
              height: deviceInfo.localHeight / 2,
            );
          },
        )),
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    //هنا بجيب مقاسات الشاشه كلها
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Hello Responsive",
              style: TextStyle(fontSize: 24),
            ),
            Container(
              width: screenWidth,
              height: 30,
              color: Colors.red,
              child: Center(
                //بحط اللاي اوت بيلدر جوا الويدجت الي عايز اعرف مقاساتها
                //هنا انا عايز اعرف مقاسات الكونتينر الاحمر
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    //هنا انا بجيب مقاسات الويدجت نفسها
                    MyDeviceType deviceType = Responsive()
                        .getDeviceType(mediaQueryData: mediaQueryData);
                    print(deviceType);
                    double localHeight = constraints.maxHeight;
                    double localWidth = constraints.maxWidth;
                    print("screenHeight $screenHeight");
                    print("localHeight $localHeight");
                    print("screenWidth $screenWidth");
                    print("localWidth $localWidth");
                    return Container(
                      height: localHeight / 2,
                      color: Colors.green,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
