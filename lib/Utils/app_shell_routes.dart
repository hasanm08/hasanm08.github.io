import 'package:flow_routing/flow_routing.dart';
import 'package:hasanm08/routes/app_routes.dart';

/// Paths and index mapping shared by [WebRoot] and mobile bottom navigation.
class AppShellRoutes {
  AppShellRoutes._();

  static final List<String> paths =
      shellTabRoutes.map((route) => route.location).toList();

  static int indexForPath(String path) {
    final normalized = Uri.parse(path).path;
    final i = paths.indexOf(normalized);
    return i >= 0 ? i : 0;
  }

  static String pathForIndex(int index) {
    if (index < 0 || index >= shellTabRoutes.length) {
      return shellTabRoutes.first.location;
    }
    return shellTabRoutes[index].location;
  }

  static FlowRoute routeForIndex(int index) {
    if (index < 0 || index >= shellTabRoutes.length) {
      return shellTabRoutes.first;
    }
    return shellTabRoutes[index];
  }
}
