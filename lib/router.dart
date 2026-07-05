import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/not_found_page.dart';
import 'package:hasanm08/UI/Pages/WebApp/portfolio_shell.dart';
import 'package:hasanm08/routes/app_routes.dart';

const _shellPageKey = 'portfolio-shell';

// Tab siblings share [pageKey]; body switching is handled in [PortfolioShell].
const _tabTransition = FlowTransition.none();

final FlowRouter portfolioRouter = FlowRouter(
  initialLocation: const AboutRoute().location,
  guards: const [
    RedirectGuard(
      condition: _isRootRoute,
      redirectTo: _toAbout,
    ),
    RedirectGuard(
      condition: _isContactLegacyRoute,
      redirectTo: _toContact,
    ),
  ],
  errorBuilder: _notFoundWithOverlay,
  routes: [
    FlowLeafNode(
      FlowRouteDefinition<RootRoute>(
        name: 'root',
        pathTemplate: '/',
        builder: (context, route) => const SizedBox.shrink(),
        factory: (_) => const RootRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<ContactLegacyRoute>(
        name: 'contact-legacy',
        pathTemplate: '/contact',
        builder: (context, route) => const SizedBox.shrink(),
        factory: (_) => const ContactLegacyRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<AboutRoute>(
        name: 'about',
        pathTemplate: '/about',
        pageKey: _shellPageKey,
        transition: _tabTransition,
        builder: (context, route) => const PortfolioShell(),
        factory: (_) => const AboutRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<ContactRoute>(
        name: 'contact',
        pathTemplate: '/contact-me',
        pageKey: _shellPageKey,
        transition: _tabTransition,
        builder: (context, route) => const PortfolioShell(),
        factory: (_) => const ContactRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<ProjectsRoute>(
        name: 'projects',
        pathTemplate: '/projects',
        pageKey: _shellPageKey,
        transition: _tabTransition,
        builder: (context, route) => const PortfolioShell(),
        factory: (_) => const ProjectsRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<PackagesRoute>(
        name: 'packages',
        pathTemplate: '/packages',
        pageKey: _shellPageKey,
        transition: _tabTransition,
        builder: (context, route) => const PortfolioShell(),
        factory: (_) => const PackagesRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<MoreRoute>(
        name: 'more',
        pathTemplate: '/more',
        pageKey: _shellPageKey,
        transition: _tabTransition,
        builder: (context, route) => const PortfolioShell(),
        factory: (_) => const MoreRoute(),
      ),
    ),
    FlowLeafNode(
      FlowRouteDefinition<NotFoundRoute>(
        name: 'not-found',
        pathTemplate: '/*',
        builder: (context, route) => const NotFoundPage(),
        factory: (_) => const NotFoundRoute(),
      ),
    ),
  ],
);

/// [FlowRouter.errorBuilder] renders outside the navigator; wrap so tooltips work.
Widget _notFoundWithOverlay(BuildContext context, FlowRouteState state) {
  return Navigator(
    pages: const [
      MaterialPage<void>(
        key: ValueKey('flow-not-found'),
        child: NotFoundPage(),
      ),
    ],
    onDidRemovePage: (_) {},
  );
}

bool _isRootRoute(GuardContext context) => context.targetRoute is RootRoute;

FlowRoute _toAbout(GuardContext context) => const AboutRoute();

bool _isContactLegacyRoute(GuardContext context) =>
    context.targetRoute is ContactLegacyRoute;

FlowRoute _toContact(GuardContext context) => const ContactRoute();
