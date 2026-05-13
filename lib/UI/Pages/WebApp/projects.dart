import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hasanm08/UI/Components/nested_navigator.dart';
import 'package:hasanm08/UI/Pages/Example/custom_navigation_bar.dart';
import 'package:hasanm08/UI/Pages/Example/ticket_page.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
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
                  padding: EdgeInsets.symmetric(vertical: 8),
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
            enabled: kDebugMode,
            isToolbarVisible: kDebugMode,
            builder: (context) {
              return NestedNavigator(
                navigationKey: GlobalKey<NavigatorState>(),
                initialRoute: '/',
                routes: {
                  '/': (context) => const CustomNavigationBar(),
                  '/two': (context) => const TicketPage()
                },
              );
            },
          ),
        )
      ],
    );
  }
}
