//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasanm08/UI/Pages/WebApp/mobile_page.dart';
import 'package:hasanm08/UI/Pages/WebApp/about.dart';
import 'package:hasanm08/UI/Pages/WebApp/contact.dart';
import 'package:hasanm08/UI/Pages/WebApp/more.dart';
import 'package:hasanm08/UI/Pages/WebApp/projects.dart';
import 'package:hasanm08/UI/Pages/WebApp/web_root.dart';

import 'UI/Components/Shimms/nonweb_title_switcher.dart'
    if (dart.library.html) 'UI/Components/Shimms/web_title_switcher.dart';
import 'UI/Components/base_widget.dart';
import 'Utils/sizing_information.dart';

void main() {
  runApp(
    //DevicePreview(
    //builder: (context) =>
    const MyApp(),
    //)
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/about',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/about',
    ),
    GoRoute(
      path: '/contact',
      redirect: (_, __) => '/contact-me',
    ),
    ShellRoute(
      builder: (context, state, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            var mediaQuery = MediaQuery.of(context);
            var sizingInformation = SizingInformation(
              orientation: mediaQuery.orientation,
              deviceType: BaseWidget.getDeviceType(mediaQuery),
              screenSize: mediaQuery.size,
              localWidgetSize:
                  Size(constraints.maxWidth, constraints.maxHeight),
            );
            return _appRootForSize(context, sizingInformation, state, child);
          },
        );
      },
      routes: [
        GoRoute(
          path: '/about',
          builder: (context, state) => const About(),
        ),
        GoRoute(
          path: '/contact-me',
          builder: (context, state) => const Contact(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const Projects(),
        ),
        GoRoute(
          path: '/more',
          builder: (context, state) => const More(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //builder: DevicePreview.appBuilder,
      title: 'hasanm08 cv',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}

Widget _appRootForSize(
  BuildContext context,
  SizingInformation sizingInformation,
  GoRouterState state,
  Widget child,
) {
  var mobile = const MobilePage();
  var web = WebTitleSwitcher(
    child: WebRoot(currentPath: state.uri.path, child: child),
  );
  switch (sizingInformation.deviceType) {
    case null:
      return const Text("");
    case DeviceScreenType.mobile:
      return mobile;
    case DeviceScreenType.tablet:
      return mobile;
    case DeviceScreenType.desktop:
      return BaseWidget(builder: (context, sizingInformation) {
        return web;
      });
  }
}
