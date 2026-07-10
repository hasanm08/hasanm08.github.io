import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/l10n/localized_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Packages extends StatelessWidget {
  const Packages({super.key});

  static const double _wideBreakpoint = 960;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= _wideBreakpoint;
        final horizontalPadding = isWide ? 24.0 : 12.0;

        return Scrollbar(
          child: PortfolioStaggeredListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              16,
              horizontalPadding,
              24,
            ),
            itemCount: _packages.length + 1,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    l10n.packagesTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: 'Exo2',
                      fontSize: isWide ? 30 : 24,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
              return _PackageCard(
                package: _packages[index - 1],
                isCompact: !isWide,
              );
            },
          ),
        );
      },
    );
  }
}

class _Package {
  const _Package({
    required this.name,
    required this.icon,
    required this.tagline,
    required this.description,
    this.features = const [],
    this.technicalDetails = const [],
    this.tags = const [],
    this.links = const [],
    this.license,
  });

  final String name;
  final IconData icon;
  final LocalizedText tagline;
  final LocalizedText description;
  final List<LocalizedText> features;
  final List<LocalizedText> technicalDetails;
  final List<String> tags;
  final List<_PackageLink> links;
  final LocalizedText? license;
}

class _PackageLink {
  const _PackageLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

final List<_Package> _packages = [
  _Package(
    name: 'flow_routing',
    icon: Icons.alt_route,
    tagline: LocalizedText(
      'Routing that feels obvious in code and honest in the browser.',
      'مسیریابی که در کد واضح است و در مرورگر صادقانه عمل می‌کند.',
    ),
    description: LocalizedText(
      'After months of fighting routing bugs — wrong URLs on refresh, tabs that '
          'behaved like full page pushes, string paths scattered everywhere, guards '
          'that were hard to reason about — I built Flow from scratch. flow_routing '
          'is a Flutter router not wrapped around GoRouter: typed routes, derived '
          'URLs, refresh-safe web navigation, and tab stacks that don\'t feel like '
          'opening a new app every time.',
      'بعد از ماه‌ها درگیری با باگ‌های مسیریابی — URL اشتباه بعد از رفرش، تب‌هایی '
          'که مثل push صفحهٔ کامل رفتار می‌کردند، مسیرهای رشته‌ای پراکنده، گاردهایی '
          'که سخت قابل فهم بودند — Flow را از صفر ساختم. flow_routing روتر فلاتر است '
          'که دور GoRouter پیچیده نشده: مسیرهای تایپ‌شده، URLهای مشتق‌شده، ناوبری وب '
          'ایمن در برابر رفرش، و استک تب‌هایی که هر بار حس اپ جدید نمی‌دهند.',
    ),
    features: const [
      LocalizedText(
        'Typed routes first — navigate with UserRoute(id: 42), not magic strings',
        'مسیرهای تایپ‌شده — ناوبری با UserRoute(id: 42)، نه رشته‌های جادویی',
      ),
      LocalizedText(
        'URLs you don\'t hand-write — routes derive their own location',
        'URLهایی که دستی نمی‌نویسید — مسیرها location خود را می‌سازند',
      ),
      LocalizedText(
        'Clean web URLs — deep links, back/forward, refresh-safe',
        'URLهای تمیز وب — لینک عمیق، عقب/جلو، ایمن در برابر رفرش',
      ),
      LocalizedText(
        'Real tab navigation — switch tabs without full-page pushes',
        'ناوبری واقعی تب — تعویض تب بدون push صفحهٔ کامل',
      ),
      LocalizedText(
        'Guards and middleware — auth, redirects, logging in a clear pipeline',
        'گارد و middleware — احراز هویت، ریدایرکت، لاگ در خط لولهٔ شفاف',
      ),
      LocalizedText(
        'Separated stacks — declarative go vs imperative push overlays',
        'استک‌های جدا — go اعلانی در برابر overlayهای push امری',
      ),
      LocalizedText(
        'No code generation — strong types without build_runner',
        'بدون code generation — تایپ قوی بدون build_runner',
      ),
    ],
    technicalDetails: const [
      LocalizedText(
        'context.flow, context.pop — URL always derived from the route',
        'context.flow، context.pop — URL همیشه از مسیر مشتق می‌شود',
      ),
      LocalizedText(
        'Full example app, docs, tests, and GoRouter/AutoRoute migration notes',
        'اپ نمونه، مستندات، تست‌ها و یادداشت مهاجرت از GoRouter/AutoRoute',
      ),
    ],
    tags: ['Flutter', 'Dart', 'Web', 'Open Source', 'Routing'],
    links: [
      _PackageLink(
        label: 'pub.dev',
        url: 'https://pub.dev/packages/flow_routing',
        icon: Icons.widgets_outlined,
      ),
      _PackageLink(
        label: 'Source',
        url: 'https://github.com/hasanm08/flow',
        icon: Icons.code,
      ),
    ],
    license: LocalizedText(
      'Open source. Star it, try the example, break it — feedback welcome.',
      'متن‌باز. ستاره بدهید، نمونه را امتحان کنید، بشکنید — بازخورد خوش‌آمد است.',
    ),
  ),
  _Package(
    name: 'flow_showcase',
    icon: Icons.tour,
    tagline: LocalizedText(
      'Onboarding that spotlights what matters — without dragging in half of pub.',
      'آنبوردینگی که آنچه مهم است را برجسته می‌کند — بدون وابستگی‌های سنگین.',
    ),
    description: LocalizedText(
      'Most showcase packages either feel heavy or fight your layout. flow_showcase '
          'is a lightweight Flutter walkthrough: wrap widgets once with FlowShowcaseTarget, '
          'start a tour by id, and get blurred spotlight overlays, adaptive tooltips, and '
          'multi-step navigation — zero third-party runtime dependencies. This portfolio '
          'uses it for the first-run tour you see in the shell.',
      'بیشتر پکیج‌های showcase یا سنگین‌اند یا با layout شما می‌جنگند. flow_showcase '
          'یک walkthrough سبک فلاتر است: ویجت‌ها را یک‌بار با FlowShowcaseTarget بپیچید، '
          'تور را با id شروع کنید، و overlay spotlight محو، tooltip تطبیقی و ناوبری '
          'چندمرحله‌ای بگیرید — بدون هیچ وابستگی runtime شخص ثالث. این پورتفولیو از آن '
          'برای تور اولین اجرا در shell استفاده می‌کند.',
    ),
    features: const [
      LocalizedText(
        'Declarative targets — wrap once, tour by id',
        'هدف‌های اعلانی — یک‌بار بپیچید، با id تور بگیرید',
      ),
      LocalizedText(
        'Multi-step flows — skip, next, and dot navigation',
        'جریان چندمرحله‌ای — رد کردن، بعدی و ناوبری نقطه‌ای',
      ),
      LocalizedText(
        'Adaptive layout — tooltips flip above/below targets on any screen',
        'چیدمان تطبیقی — tooltip بالا/پایین هدف روی هر صفحه',
      ),
      LocalizedText(
        'Performance focused — one animation controller per step, minimal rebuilds',
        'متمرکز بر عملکرد — یک کنترلر انیمیشن در هر مرحله، rebuild کم',
      ),
      LocalizedText(
        'Fully customizable — blur, colors, timing, and copy via FlowShowcaseStyle',
        'کاملاً قابل سفارشی‌سازی — blur، رنگ، زمان‌بندی و متن با FlowShowcaseStyle',
      ),
      LocalizedText(
        'Memory safe — registry cleanup on dispose, overlay removed on skip/complete',
        'ایمن در حافظه — پاک‌سازی registry در dispose، حذف overlay در skip/complete',
      ),
    ],
    technicalDetails: const [
      LocalizedText(
        'FlowShowcaseTarget registers GlobalKeys; FlowShowcaseController drives the sequence',
        'FlowShowcaseTarget کلیدهای GlobalKey را ثبت می‌کند؛ FlowShowcaseController توالی را می‌راند',
      ),
      LocalizedText(
        'Full example app with dashboard demo — bottom nav and FAB highlights',
        'اپ نمونه کامل با دمو داشبورد — هایلایت bottom nav و FAB',
      ),
    ],
    tags: ['Flutter', 'Dart', 'Open Source', 'Onboarding', 'UX'],
    links: [
      _PackageLink(
        label: 'pub.dev',
        url: 'https://pub.dev/packages/flow_showcase',
        icon: Icons.widgets_outlined,
      ),
      _PackageLink(
        label: 'Source',
        url: 'https://github.com/hasanm08/flow_showcase',
        icon: Icons.code,
      ),
    ],
    license: LocalizedText(
      'Open source (MIT). Issues and pull requests welcome on GitHub.',
      'متن‌باز (MIT). issue و pull request در GitHub خوش‌آمد است.',
    ),
  ),
  _Package(
    name: 'tv_textfield',
    icon: Icons.tv,
    tagline: LocalizedText(
      'Flutter on TV shouldn\'t feel broken.',
      'فلاتر روی تلویزیون نباید حس خرابی بدهد.',
    ),
    description: LocalizedText(
      'If you\'ve built for Android TV or Apple TV, you\'ve probably hit this: '
          'focus gets stuck, the remote stops cooperating, and text fields fight you '
          'instead of helping you. tv_textfield is a Flutter package that makes '
          'TextField actually work on TV — a drop-in replacement where you swap '
          'TextField for TvTextField.',
      'اگر برای Android TV یا Apple TV توسعه داده‌اید، احتمالاً این را دیده‌اید: '
          'فوکوس گیر می‌کند، ریموت همکاری نمی‌کند و فیلدهای متنی به‌جای کمک، '
          'مقاومت می‌کنند. tv_textfield پکیجی فلاتر است که TextField را واقعاً روی '
          'تلویزیون کاربردی می‌کند — جایگزین مستقیم با تعویض TextField به TvTextField.',
    ),
    features: const [
      LocalizedText(
        'Fixes D-pad / Siri Remote focus issues',
        'رفع مشکلات فوکوس D-pad و Siri Remote',
      ),
      LocalizedText(
        'Supports software and hardware keyboards',
        'پشتیبانی از کیبوردهای نرم‌افزاری و سخت‌افزاری',
      ),
      LocalizedText(
        'Works across Android TV, Apple TV, iOS, desktop, and web',
        'سازگار با Android TV، Apple TV، iOS، دسکتاپ و وب',
      ),
      LocalizedText(
        'Drop-in API — swap TextField for TvTextField',
        'API جایگزین مستقیم — TextField را با TvTextField عوض کنید',
      ),
    ],
    technicalDetails: const [
      LocalizedText('Native EditText on Android', 'EditText بومی روی اندروید'),
      LocalizedText(
        'Native UITextField on Apple TV',
        'UITextField بومی روی Apple TV',
      ),
      LocalizedText(
        'Smart Flutter fallback everywhere else',
        'فالبک هوشمند فلاتر در بقیهٔ پلتفرم‌ها',
      ),
    ],
    tags: ['Flutter', 'Android TV', 'Apple TV', 'tvOS', 'Open Source', 'Dart'],
    links: [
      _PackageLink(
        label: 'pub.dev',
        url: 'https://pub.dev/packages/tv_textfield',
        icon: Icons.widgets_outlined,
      ),
      _PackageLink(
        label: 'Source',
        url: 'https://github.com/hasanm08/tv_textfield',
        icon: Icons.code,
      ),
    ],
    license: LocalizedText(
      'Open source (MIT). Feedback and contributions welcome.',
      'متن‌باز (MIT). بازخورد و مشارکت خوش‌آمد است.',
    ),
  ),
];

class _PackageCard extends StatefulWidget {
  const _PackageCard({required this.package, required this.isCompact});

  final _Package package;
  final bool isCompact;

  @override
  State<_PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<_PackageCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final package = widget.package;
    final isCompact = widget.isCompact;
    final titleStyle = TextStyle(
      fontSize: isCompact ? 20 : 24,
      fontFamily: 'Exo2',
      color: scheme.primary,
      letterSpacing: isCompact ? 0.6 : 1.0,
      fontWeight: FontWeight.w600,
    );
    final taglineStyle = TextStyle(
      fontSize: isCompact ? 14 : 16,
      fontFamily: 'Exo2',
      color: scheme.primary.withValues(alpha: 0.85),
      fontStyle: FontStyle.italic,
      height: 1.35,
    );
    final sectionStyle = TextStyle(
      fontSize: isCompact ? 13 : 14,
      fontFamily: 'Exo2',
      color: scheme.onSurface.withValues(alpha: 0.75),
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    );
    final bodyStyle = TextStyle(
      fontSize: isCompact ? 14 : 16,
      fontFamily: 'Exo2',
      color: scheme.onSurface.withValues(alpha: 0.92),
      height: 1.4,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.008 : 1.0,
        duration: PortfolioMotion.medium,
        curve: PortfolioMotion.standard,
        child: AnimatedContainer(
          duration: PortfolioMotion.medium,
          curve: PortfolioMotion.standard,
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: scheme.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: _hover ? 0.22 : 0.12),
                blurRadius: _hover ? 28 : 14,
                offset: Offset(0, _hover ? 12 : 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(isCompact ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    package.icon,
                    color: scheme.primary,
                    size: isCompact ? 22 : 26,
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(package.name, style: titleStyle)),
                ],
              ),
              const SizedBox(height: 8),
              Text(package.tagline.resolve(locale), style: taglineStyle),
              const SizedBox(height: 12),
              Text(package.description.resolve(locale), style: bodyStyle),
              if (package.features.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(l10n.packagesWhatItDoes, style: sectionStyle),
                const SizedBox(height: 8),
                ...package.features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: isCompact ? 6 : 7),
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: scheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature.resolve(locale),
                            style: bodyStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (package.technicalDetails.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(l10n.packagesUnderTheHood, style: sectionStyle),
                const SizedBox(height: 8),
                ...package.technicalDetails.map(
                  (detail) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: isCompact ? 6 : 7),
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: scheme.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(detail.resolve(locale), style: bodyStyle),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (package.license != null) ...[
                const SizedBox(height: 12),
                Text(
                  package.license!.resolve(locale),
                  style: bodyStyle.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.7),
                    fontSize: isCompact ? 13 : 14,
                  ),
                ),
              ],
              if (package.tags.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tag in package.tags) _TagChip(label: tag),
                  ],
                ),
              ],
              if (package.links.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final link in package.links)
                      _LinkButton(
                        link: link,
                        isCompact: isCompact,
                        label: l10n.linkLabel(link.label),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.45)),
      ),
      child: Text(
        '#$label',
        style: TextStyle(
          fontFamily: 'Exo2',
          fontSize: 12,
          color: scheme.primary,
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  const _LinkButton({
    required this.link,
    required this.isCompact,
    required this.label,
  });

  final _PackageLink link;
  final bool isCompact;
  final String label;

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = scheme.primary;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: PortfolioMotion.medium,
          curve: PortfolioMotion.standard,
          padding: EdgeInsets.symmetric(
            horizontal: widget.isCompact ? 12 : 14,
            vertical: widget.isCompact ? 8 : 10,
          ),
          decoration: BoxDecoration(
            color: _hovering ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: color),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.link.icon,
                size: widget.isCompact ? 16 : 18,
                color: _hovering ? scheme.onPrimary : color,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Exo2',
                  fontSize: widget.isCompact ? 13 : 14,
                  color: _hovering ? scheme.onPrimary : color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _open() async {
    final uri = Uri.parse(widget.link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
