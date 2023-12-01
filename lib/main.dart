//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/MobilePage.dart';
import 'package:hasanm08/UI/Pages/WebApp/WebRoot.dart';

import 'UI/BaseWidget.dart';
import 'UI/SizinigInformation.dart';
import 'UI/Components/Shimms/nonweb_title_switcher.dart'
    if (dart.library.html) 'UI/Components/Shimms/web_title_switcher.dart';

void main() {
  runApp(
    //DevicePreview(
    //builder: (context) =>
    MyApp(),
    //)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      title: 'hasanm08 cv',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: LayoutBuilder(
        builder: (context, constraints) {
          var mediaQuery = MediaQuery.of(context);
          var sizingInformation = SizingInformation(
            orientation: mediaQuery.orientation,
            deviceType: BaseWidget.getDeviceType(mediaQuery),
            screenSize: mediaQuery.size,
            localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
          );
          return builder(context, sizingInformation);
        },
      ),
    );
  }
}

Widget builder(BuildContext context, SizingInformation sizingInformation) {
  var mobile = const MobilePage();
  var web = const WebTitleSwitcher(child: WebRoot());
  switch (sizingInformation.deviceType) {
    case null:
      return const Text("");
    case DeviceScreenType.Mobile:
      return mobile;
    case DeviceScreenType.Tablet:
      return mobile;
    case DeviceScreenType.Web:
      return BaseWidget(builder: (context, sizingInformation) {
        return web;
      });
  }
}
