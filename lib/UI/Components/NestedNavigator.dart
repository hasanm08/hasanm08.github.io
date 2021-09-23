import 'package:flutter/material.dart';

class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigationKey;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  NestedNavigator({
    required this.navigationKey,
    required this.initialRoute,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings routeSettings) {
        WidgetBuilder builder = routes[routeSettings.name]!;
        return MaterialPageRoute(
          builder: builder,
          settings: routeSettings,
        );
      },
    );
  }
}
