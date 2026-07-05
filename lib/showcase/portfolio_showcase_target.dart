import 'package:flow_showcase/flow_showcase.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/showcase/portfolio_showcase.dart';

/// Localized wrapper around [FlowShowcaseTarget] for portfolio shell widgets.
class PortfolioShowcaseTarget extends StatelessWidget {
  const PortfolioShowcaseTarget({
    super.key,
    required this.id,
    required this.child,
  });

  final String id;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final copy = _copyForId(l10n, id);

    return FlowShowcaseTarget(
      id: id,
      title: copy.$1,
      content: copy.$2,
      child: child,
    );
  }

  static (String, String) _copyForId(AppLocalizations l10n, String id) {
    return switch (id) {
      PortfolioShowcaseIds.navAbout => (
          l10n.showcaseNavAboutTitle,
          l10n.showcaseNavAboutContent,
        ),
      PortfolioShowcaseIds.navContact => (
          l10n.showcaseNavContactTitle,
          l10n.showcaseNavContactContent,
        ),
      PortfolioShowcaseIds.navProjects => (
          l10n.showcaseNavProjectsTitle,
          l10n.showcaseNavProjectsContent,
        ),
      PortfolioShowcaseIds.navPackages => (
          l10n.showcaseNavPackagesTitle,
          l10n.showcaseNavPackagesContent,
        ),
      PortfolioShowcaseIds.navMore => (
          l10n.showcaseNavMoreTitle,
          l10n.showcaseNavMoreContent,
        ),
      PortfolioShowcaseIds.themeToggle => (
          l10n.showcaseThemeTitle,
          l10n.showcaseThemeContent,
        ),
      PortfolioShowcaseIds.languageToggle => (
          l10n.showcaseLanguageTitle,
          l10n.showcaseLanguageContent,
        ),
      PortfolioShowcaseIds.contentArea => (
          l10n.showcaseContentTitle,
          l10n.showcaseContentContent,
        ),
      _ => (l10n.showcaseDefaultTitle, l10n.showcaseDefaultContent),
    };
  }
}
