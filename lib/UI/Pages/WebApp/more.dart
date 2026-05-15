import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasanm08/UI/Components/contact_button.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/Utils/cv_paths.dart';
import 'package:hasanm08/Utils/cv_download_stub.dart'
    if (dart.library.html) 'package:hasanm08/Utils/cv_download_web.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    final cvUrl = cvAbsoluteUrl();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: PortfolioStaggeredColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n.moreTitle,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: scheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.moreSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            _sectionLabel(context, l10n.moreResume),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ContactButton(
                  icon: Icons.description_outlined,
                  link: cvUrl,
                  title: l10n.moreViewCv,
                  onPressed: () => launchUrl(
                    Uri.parse(cvUrl),
                    mode: LaunchMode.externalApplication,
                  ),
                ),
                ContactButton(
                  icon: Icons.download_outlined,
                  link: cvUrl,
                  title: l10n.moreDownloadCv,
                  onPressed: () => downloadCvFile(cvUrl, cvFileName),
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionLabel(context, l10n.moreJumpTo),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                _QuickRouteButton(
                  label: l10n.navAbout,
                  icon: Icons.person_outline,
                  path: '/about',
                ),
                _QuickRouteButton(
                  label: l10n.navProjects,
                  icon: Icons.work_outline,
                  path: '/projects',
                ),
                _QuickRouteButton(
                  label: l10n.navContact,
                  icon: Icons.mail_outline,
                  path: '/contact-me',
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionLabel(context, l10n.moreThisSite),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ContactButton(
                  icon: Icons.code,
                  link: 'https://github.com/hasanm08/hasanm08.github.io',
                  title: l10n.moreSource,
                ),
                ContactButton(
                  icon: Icons.bug_report_outlined,
                  link: 'https://github.com/hasanm08/hasanm08.github.io/issues',
                  title: l10n.moreReportIssue,
                ),
                ContactButton(
                  icon: Icons.public,
                  link: 'https://hasanm08.github.io',
                  title: l10n.moreLiveSite,
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionLabel(context, l10n.moreDevPicks),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ContactButton(
                  icon: Icons.menu_book_outlined,
                  link: 'https://docs.flutter.dev',
                  title: l10n.moreFlutterDocs,
                ),
                ContactButton(
                  icon: Icons.extension,
                  link: 'https://pub.dev',
                  title: l10n.morePubDev,
                ),
                ContactButton(
                  icon: Icons.school_outlined,
                  link: 'https://dart.dev/guides',
                  title: l10n.moreDartGuides,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              l10n.moreFooter,
              style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.45),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _sectionLabel(BuildContext context, String text) {
    final scheme = Theme.of(context).colorScheme;
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: scheme.primary,
          ),
    );
  }
}

class _QuickRouteButton extends StatelessWidget {
  const _QuickRouteButton({
    required this.label,
    required this.icon,
    required this.path,
  });

  final String label;
  final IconData icon;
  final String path;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      onPressed: () => context.go(path),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        side: BorderSide(color: scheme.outline),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}
