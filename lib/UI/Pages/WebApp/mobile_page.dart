import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/providers/app_settings.dart';
import 'package:hasanm08/showcase/portfolio_showcase.dart';
import 'package:hasanm08/showcase/portfolio_showcase_target.dart';
import 'package:provider/provider.dart';

/// Mobile/tablet shell: same route-driven tabs as [WebRoot], with a bottom bar.
class MobilePage extends StatelessWidget {
  const MobilePage({super.key, required this.currentPath, required this.child});

  final String currentPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = AppShellRoutes.indexForPath(currentPath);
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        actions: [
          Consumer<AppSettings>(
            builder: (context, settings, _) {
              return PortfolioShowcaseTarget(
                id: PortfolioShowcaseIds.themeToggle,
                child: IconButton(
                  tooltip: l10n.themeTooltip,
                  onPressed: settings.cycleTheme,
                  icon: Icon(_themeIcon(settings.themeMode)),
                ),
              );
            },
          ),
          Consumer<AppSettings>(
            builder: (context, settings, _) {
              return PortfolioShowcaseTarget(
                id: PortfolioShowcaseIds.languageToggle,
                child: IconButton(
                  tooltip: l10n.languageTooltip,
                  onPressed: settings.toggleLocale,
                  icon: Text(
                    settings.locale.languageCode == 'fa' ? 'فا' : 'EN',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Exo2',
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurface.withValues(alpha: 0.55),
        onTap: (index) {
          final route = AppShellRoutes.routeForIndex(index);
          if (route.location != currentPath) {
            context.flow(route);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: PortfolioShowcaseTarget(
              id: PortfolioShowcaseIds.navAbout,
              child: const Icon(Icons.person),
            ),
            label: l10n.navAbout,
          ),
          BottomNavigationBarItem(
            icon: PortfolioShowcaseTarget(
              id: PortfolioShowcaseIds.navContact,
              child: const Icon(Icons.call),
            ),
            label: l10n.navContact,
          ),
          BottomNavigationBarItem(
            icon: PortfolioShowcaseTarget(
              id: PortfolioShowcaseIds.navProjects,
              child: const Icon(Icons.work),
            ),
            label: l10n.navProjects,
          ),
          BottomNavigationBarItem(
            icon: PortfolioShowcaseTarget(
              id: PortfolioShowcaseIds.navPackages,
              child: const Icon(Icons.widgets_outlined),
            ),
            label: l10n.navPackages,
          ),
          BottomNavigationBarItem(
            icon: PortfolioShowcaseTarget(
              id: PortfolioShowcaseIds.navMore,
              child: const Icon(Icons.more_horiz),
            ),
            label: l10n.navMore,
          ),
        ],
      ),
    );
  }

  static IconData _themeIcon(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
      ThemeMode.system => Icons.brightness_auto_outlined,
    };
  }
}
