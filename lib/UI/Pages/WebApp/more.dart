import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasanm08/UI/Components/contact_button.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: PortfolioStaggeredColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'More',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Jump around the site, open the source, or grab a few dev links.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            _sectionLabel(context, 'Jump to'),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: const [
                _QuickRouteButton(
                  label: 'About',
                  icon: Icons.person_outline,
                  path: '/about',
                ),
                _QuickRouteButton(
                  label: 'Projects',
                  icon: Icons.work_outline,
                  path: '/projects',
                ),
                _QuickRouteButton(
                  label: 'Contact',
                  icon: Icons.mail_outline,
                  path: '/contact-me',
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionLabel(context, 'This site'),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                ContactButton(
                  icon: Icons.code,
                  link: 'https://github.com/hasanm08/hasanm08.github.io',
                  title: 'Source code',
                ),
                ContactButton(
                  icon: Icons.bug_report_outlined,
                  link: 'https://github.com/hasanm08/hasanm08.github.io/issues',
                  title: 'Report issue',
                ),
                ContactButton(
                  icon: Icons.public,
                  link: 'https://hasanm08.github.io',
                  title: 'Live site',
                ),
              ],
            ),
            const SizedBox(height: 28),
            _sectionLabel(context, 'Developer picks'),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              children: const [
                ContactButton(
                  icon: Icons.menu_book_outlined,
                  link: 'https://docs.flutter.dev',
                  title: 'Flutter docs',
                ),
                ContactButton(
                  icon: Icons.extension,
                  link: 'https://pub.dev',
                  title: 'pub.dev',
                ),
                ContactButton(
                  icon: Icons.school_outlined,
                  link: 'https://dart.dev/guides',
                  title: 'Dart guides',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Portfolio v2.1.0 · Built with Flutter',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.black38,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _sectionLabel(BuildContext context, String text) {
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Colors.teal.shade700,
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
    return OutlinedButton.icon(
      onPressed: () => context.go(path),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.teal.shade700,
        side: BorderSide(color: Colors.teal.shade400),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}
