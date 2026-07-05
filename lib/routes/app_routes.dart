import 'package:flow_routing/flow_routing.dart';

/// Root path redirect target (`/` → `/about`).
final class RootRoute extends FlowRoute {
  const RootRoute();
  @override
  String get name => 'root';
  @override
  String get pathTemplate => '/';
}

/// Legacy contact path (`/contact` → `/contact-me`).
final class ContactLegacyRoute extends FlowRoute {
  const ContactLegacyRoute();
  @override
  String get name => 'contact-legacy';
  @override
  String get pathTemplate => '/contact';
}

final class AboutRoute extends FlowRoute {
  const AboutRoute();
  @override
  String get name => 'about';
  @override
  String get pathTemplate => '/about';
}

final class ContactRoute extends FlowRoute {
  const ContactRoute();
  @override
  String get name => 'contact';
  @override
  String get pathTemplate => '/contact-me';
}

final class ProjectsRoute extends FlowRoute {
  const ProjectsRoute();
  @override
  String get name => 'projects';
  @override
  String get pathTemplate => '/projects';
}

final class PackagesRoute extends FlowRoute {
  const PackagesRoute();
  @override
  String get name => 'packages';
  @override
  String get pathTemplate => '/packages';
}

final class MoreRoute extends FlowRoute {
  const MoreRoute();
  @override
  String get name => 'more';
  @override
  String get pathTemplate => '/more';
}

/// Catch-all for unknown paths (must stay last in the route table).
final class NotFoundRoute extends FlowRoute {
  const NotFoundRoute();
  @override
  String get name => 'not-found';
  @override
  String get pathTemplate => '/*';
}

/// Shell tab routes in navigation order.
const List<FlowRoute> shellTabRoutes = [
  AboutRoute(),
  ContactRoute(),
  ProjectsRoute(),
  PackagesRoute(),
  MoreRoute(),
];
