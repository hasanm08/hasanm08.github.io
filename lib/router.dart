import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/not_found_page.dart';
import 'package:hasanm08/UI/Pages/WebApp/portfolio_shell.dart';
import 'package:hasanm08/routes/app_routes.dart';

const _shellPageKey = 'portfolio-shell';

// Tab siblings share [pageKey]; body switching is handled in [PortfolioShell].
const _tabTransition = FlowTransition.none();

final FlowRouter portfolioRouter = FlowRouter(
  initialLocation: Routes.about.location,
  guards: const [
    RedirectGuard(condition: _isRootRoute, redirectTo: _toAbout),
    RedirectGuard(condition: _isContactLegacyRoute, redirectTo: _toContact),
  ],
  errorBuilder: _notFoundWithOverlay,
  routes: [
    flow(
      '/',
      name: 'root',
      builder: (context, route) => const SizedBox.shrink(),
    ),
    flow(
      '/contact',
      name: 'contact-legacy',
      builder: (context, route) => const SizedBox.shrink(),
    ),
    flow(
      '/about',
      name: 'about',
      pageKey: _shellPageKey,
      transition: _tabTransition,
      builder: (context, route) => const PortfolioShell(),
    ),
    flow(
      '/contact-me',
      name: 'contact',
      pageKey: _shellPageKey,
      transition: _tabTransition,
      builder: (context, route) => const PortfolioShell(),
    ),
    flow(
      '/projects',
      name: 'projects',
      pageKey: _shellPageKey,
      transition: _tabTransition,
      builder: (context, route) => const PortfolioShell(),
    ),
    flow(
      '/packages',
      name: 'packages',
      pageKey: _shellPageKey,
      transition: _tabTransition,
      builder: (context, route) => const PortfolioShell(),
    ),
    flow(
      '/more',
      name: 'more',
      pageKey: _shellPageKey,
      transition: _tabTransition,
      builder: (context, route) => const PortfolioShell(),
    ),
    flow(
      '/*',
      name: 'not-found',
      builder: (context, route) => const NotFoundPage(),
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

bool _isRootRoute(GuardContext context) => context.targetRoute.isName('root');

FlowRoute _toAbout(GuardContext context) => Routes.about;

bool _isContactLegacyRoute(GuardContext context) =>
    context.targetRoute.isName('contact-legacy');

FlowRoute _toContact(GuardContext context) => Routes.contact;
