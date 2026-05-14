import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/menu_button.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/providers/app_settings.dart';
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
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
                      MenuButton(
                        icon: Icons.person,
                        text: l10n.navAbout,
                        route: '/about',
                        isSelected: selectedIndex == 0,
                      ),
                      MenuButton(
                        icon: Icons.call,
                        text: l10n.navContact,
                        route: '/contact-me',
                        isSelected: selectedIndex == 1,
                      ),
                      MenuButton(
                        icon: Icons.work,
                        text: l10n.navProjects,
                        route: '/projects',
                        isSelected: selectedIndex == 2,
                      ),
                      MenuButton(
                        icon: Icons.more_horiz,
                        text: l10n.navMore,
                        route: '/more',
                        isSelected: selectedIndex == 3,
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
                                IconButton(
                                  tooltip: l10n.themeTooltip,
                                  onPressed: settings.cycleTheme,
                                  icon: Icon(
                                    _themeIcon(settings.themeMode),
                                    color: scheme.onPrimary,
                                  ),
                                ),
                                IconButton(
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
