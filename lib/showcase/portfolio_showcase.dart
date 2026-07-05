import 'package:flow_showcase/flow_showcase.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Target ids registered via [PortfolioShowcaseTarget] in the shell UI.
abstract final class PortfolioShowcaseIds {
  static const navAbout = 'nav_about';
  static const navContact = 'nav_contact';
  static const navProjects = 'nav_projects';
  static const navPackages = 'nav_packages';
  static const navMore = 'nav_more';
  static const themeToggle = 'theme_toggle';
  static const languageToggle = 'language_toggle';
  static const contentArea = 'content_area';

  static const all = [
    navAbout,
    navContact,
    navProjects,
    navPackages,
    navMore,
    themeToggle,
    languageToggle,
    contentArea,
  ];
}

/// Starts the portfolio walkthrough once per device/browser.
class PortfolioShowcase {
  PortfolioShowcase._();

  static const _prefsKey = 'portfolio_showcase_seen';

  static FlowShowcaseController? _controller;

  static Future<bool> hasSeen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_prefsKey) ?? false;
    } catch (_) {
      return false;
    }
  }

  static Future<void> markSeen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsKey, true);
    } catch (_) {}
  }

  static void disposeActive() {
    _controller?.dispose();
    _controller = null;
  }

  /// Registers targets on the first frame, then starts the tour if not seen yet.
  static Future<void> tryStart(BuildContext context) async {
    if (!context.mounted) return;
    if (await hasSeen()) return;
    if (!context.mounted) return;

    final l10n = AppLocalizations.of(context);
    _controller?.dispose();
    _controller = FlowShowcaseController.start(
      context,
      ids: PortfolioShowcaseIds.all,
      useRootOverlay: true,
      style: FlowShowcaseStyle(
        nextButtonLabel: l10n.showcaseNext,
        skipButtonLabel: l10n.showcaseSkip,
        fadeDuration: const Duration(milliseconds: 300),
      ),
      onComplete: markSeen,
    );
  }
}
