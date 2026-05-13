//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasanm08/UI/Pages/WebApp/about.dart';
import 'package:hasanm08/UI/Pages/WebApp/contact.dart';
import 'package:hasanm08/UI/Pages/WebApp/mobile_page.dart';
import 'package:hasanm08/UI/Pages/WebApp/more.dart';
import 'package:hasanm08/UI/Pages/WebApp/projects.dart';
import 'package:hasanm08/UI/Pages/WebApp/web_root.dart';

import 'UI/Components/base_widget.dart';
import 'Utils/sizing_information.dart';
import 'Utils/web_url_strategy_stub.dart'
    if (dart.library.html) 'Utils/web_url_strategy_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureWebUrlStrategy();
  runApp(
    //DevicePreview(
    //builder: (context) =>
    const MyApp(),
    //)
  );
}

CustomTransitionPage<void> _shellChildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 260),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.036),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
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
          pageBuilder: (context, state) =>
              _shellChildPage(state, const About()),
        ),
        GoRoute(
          path: '/contact-me',
          pageBuilder: (context, state) =>
              _shellChildPage(state, const Contact()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) =>
              _shellChildPage(state, const Projects()),
        ),
        GoRoute(
          path: '/more',
          pageBuilder: (context, state) => _shellChildPage(state, const More()),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  var mobile = MobilePage(
    currentPath: state.uri.path,
    child: child,
  );
  var web = WebRoot(
    currentPath: state.uri.path,
    child: child,
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
