//import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/providers/app_settings.dart';
import 'package:hasanm08/router.dart';
import 'package:hasanm08/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior().copyWith(scrollbars: false),
      child: Consumer<AppSettings>(
        builder: (context, settings, _) {
          return MaterialApp.router(
            title: 'hasanm08 cv',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.themeMode,
            themeAnimationDuration: PortfolioMotion.medium,
            themeAnimationCurve: PortfolioMotion.standard,
            locale: settings.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: portfolioRouter.config,
          );
        },
      ),
    );
  }
}
