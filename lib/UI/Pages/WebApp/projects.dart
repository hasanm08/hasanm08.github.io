import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/NestedNavigator.dart';
import 'package:hasanm08/UI/Pages/Example/SecondPage.dart';
import 'package:hasanm08/UI/Pages/Example/main.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text("Travel Mobile App",
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: "Exo2",
                          color: Colors.blue,
                          wordSpacing: 0,
                          letterSpacing: 1.4)),
                ),
                Text("a test app for fly and hotel reservations.",
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Exo2", color: Colors.black)),
                Text("#Flutter",
                    style: TextStyle(
                        fontSize: 18, fontFamily: "Exo2", color: Colors.blue)),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        Expanded(
          child: DevicePreview(
            enabled: true,
            isToolbarVisible: true,

            // areSettingsEnabled: false,
            // usePreferences: false,
            style: DevicePreviewStyle(
                background: BoxDecoration(color: Colors.transparent),
                // hasFrameShadow: false,
                toolBar: DevicePreviewToolBarStyle(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    buttonBackgroundColor: Colors.blue,
                    buttonHoverBackgroundColor: Colors.black,
                    position: DevicePreviewToolBarPosition.right,
                    buttonsVisibility:
                        DevicePreviewButtonsVisibilityStyleData(),
                    fontStyles: DevicePreviewToolBarTextStyleData(
                        title: TextStyle(fontSize: 18, color: Colors.white),
                        fieldLabel:
                            TextStyle(fontSize: 16, color: Colors.white),
                        body: TextStyle(fontSize: 14, color: Colors.white),
                        smallBody:
                            TextStyle(fontSize: 11, color: Colors.white)),
                    spacing: DevicePreviewToolBarSpacingData(
                        big: EdgeInsets.all(8),
                        regular: EdgeInsets.all(8),
                        small: EdgeInsets.all(8)))),
            builder: (context) {
              return NestedNavigator(
                navigationKey: GlobalKey<NavigatorState>(),
                initialRoute: '/',
                routes: {
                  '/': (context) => BottomNav(),
                  '/two': (context) => SecondPage()
                },
              );
            },
          ),
        )
      ],
    );
  }
}
