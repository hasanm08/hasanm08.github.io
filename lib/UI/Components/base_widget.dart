import 'package:flutter/material.dart';

import '../../Utils/sizing_information.dart';

enum DeviceScreenType { mobile, tablet, desktop }

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation)? builder;
  const BaseWidget({super.key, this.builder});
  static DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    var orientation = (mediaQuery.size.height > mediaQuery.size.width)
        ? Orientation.landscape
        : Orientation.portrait;

    double deviceWidth = 0;

    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }

    if (deviceWidth > 950) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth > 600) {
      return DeviceScreenType.tablet;
    }

    return DeviceScreenType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizingInformation = SizingInformation(
      orientation: mediaQuery.orientation,
      deviceType: getDeviceType(mediaQuery),
      screenSize: mediaQuery.size,
    );
    return builder!(context, sizingInformation);
  }
}
