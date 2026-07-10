import 'package:flow_routing/flow_routing.dart';

/// App route instances — no subclasses required.
///
/// ```dart
/// context.flow(Routes.about);
/// context.flow(Routes.contact, push: true);
/// ```
abstract final class Routes {
  Routes._();

  /// Root path redirect target (`/` → `/about`).
  static const root = FlowRoute(name: 'root', pathTemplate: '/');

  /// Legacy contact path (`/contact` → `/contact-me`).
  static const contactLegacy = FlowRoute(
    name: 'contact-legacy',
    pathTemplate: '/contact',
  );

  static const about = FlowRoute(name: 'about', pathTemplate: '/about');
  static const contact = FlowRoute(
    name: 'contact',
    pathTemplate: '/contact-me',
  );
  static const projects = FlowRoute(
    name: 'projects',
    pathTemplate: '/projects',
  );
  static const packages = FlowRoute(
    name: 'packages',
    pathTemplate: '/packages',
  );
  static const more = FlowRoute(name: 'more', pathTemplate: '/more');

  /// Catch-all for unknown paths (must stay last in the route table).
  static const notFound = FlowRoute(name: 'not-found', pathTemplate: '/*');
}

/// Shell tab routes in navigation order.
const List<FlowRoute> shellTabRoutes = [
  Routes.about,
  Routes.contact,
  Routes.projects,
  Routes.packages,
  Routes.more,
];
