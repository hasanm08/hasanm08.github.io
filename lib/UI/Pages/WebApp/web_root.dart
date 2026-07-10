import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/menu_button.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/providers/app_settings.dart';
import 'package:hasanm08/routes/app_routes.dart';
import 'package:hasanm08/showcase/portfolio_showcase.dart';
import 'package:hasanm08/showcase/portfolio_showcase_target.dart';
import 'package:provider/provider.dart';

class WebRoot extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const WebRoot({
    super.key,
    required this.currentPath,
    required this.child,
  });

  int get selectedIndex => AppShellRoutes.indexForPath(currentPath);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        backgroundColor: scheme.surface,
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: scheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: scheme.shadow.withValues(alpha: 0.18),
                    blurRadius: 18,
                    offset: const Offset(4, 0),
                  ),
                ],
              ),
              child: PortfolioSidebarReveal(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      PortfolioStaggeredColumn(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/coding.png'),
                                ),
                              ),
                            ),
                          ),
                          PortfolioShowcaseTarget(
                            id: PortfolioShowcaseIds.navAbout,
                            child: MenuButton(
                              icon: Icons.person,
                              text: l10n.navAbout,
                              route: Routes.about,
                              isSelected: selectedIndex == 0,
                            ),
                          ),
                          PortfolioShowcaseTarget(
                            id: PortfolioShowcaseIds.navContact,
                            child: MenuButton(
                              icon: Icons.call,
                              text: l10n.navContact,
                              route: Routes.contact,
                              isSelected: selectedIndex == 1,
                            ),
                          ),
                          PortfolioShowcaseTarget(
                            id: PortfolioShowcaseIds.navProjects,
                            child: MenuButton(
                              icon: Icons.work,
                              text: l10n.navProjects,
                              route: Routes.projects,
                              isSelected: selectedIndex == 2,
                            ),
                          ),
                          PortfolioShowcaseTarget(
                            id: PortfolioShowcaseIds.navPackages,
                            child: MenuButton(
                              icon: Icons.widgets_outlined,
                              text: l10n.navPackages,
                              route: Routes.packages,
                              isSelected: selectedIndex == 3,
                            ),
                          ),
                          PortfolioShowcaseTarget(
                            id: PortfolioShowcaseIds.navMore,
                            child: MenuButton(
                              icon: Icons.more_horiz,
                              text: l10n.navMore,
                              route: Routes.more,
                              isSelected: selectedIndex == 4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<AppSettings>(
                          builder: (context, settings, _) {
                            return Row(
                              children: [
                                PortfolioShowcaseTarget(
                                  id: PortfolioShowcaseIds.themeToggle,
                                  child: IconButton(
                                    tooltip: l10n.themeTooltip,
                                    onPressed: settings.cycleTheme,
                                    icon: Icon(
                                      _themeIcon(settings.themeMode),
                                      color: scheme.onPrimary,
                                    ),
                                  ),
                                ),
                                PortfolioShowcaseTarget(
                                  id: PortfolioShowcaseIds.languageToggle,
                                  child: IconButton(
                                    tooltip: l10n.languageTooltip,
                                    onPressed: settings.toggleLocale,
                                    icon: Text(
                                      settings.locale.languageCode == 'fa'
                                          ? 'فا'
                                          : 'EN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: scheme.onPrimary,
                                        fontFamily: 'Exo2',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${l10n.madeWith}:',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Exo2',
                                color: scheme.onPrimary.withValues(alpha: 0.95),
                              ),
                            ),
                            FlutterLogo(
                              style: FlutterLogoStyle.horizontal,
                              textColor: scheme.onPrimary,
                              size: 70,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: scheme.surface,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: child,
                ),
              ),
            ),
          ],
        ),
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

class HomeClipper extends CustomClipper {
  @override
  getClip(Size size) {
    return Path()..moveTo(size.width / 4, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
