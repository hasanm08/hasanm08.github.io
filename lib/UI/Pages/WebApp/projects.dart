import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/l10n/localized_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

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
            itemCount: _projects.length + 1,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    l10n.projectsTitle,
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
              return _ProjectCard(
                project: _projects[index - 1],
                isCompact: !isWide,
              );
            },
          ),
        );
      },
    );
  }
}

class _Project {
  const _Project({
    required this.name,
    required this.description,
    this.dateRange,
    this.associatedWith,
    this.skills = const [],
    this.tags = const [],
    this.highlights = const [],
    this.links = const [],
  });

  final String name;
  final String? dateRange;
  final String? associatedWith;
  final LocalizedText description;
  final List<String> skills;
  final List<String> tags;
  final List<LocalizedText> highlights;
  final List<_ProjectLink> links;
}

class _ProjectLink {
  const _ProjectLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

final List<_Project> _projects = [
  _Project(
    name: 'Volvero',
    dateRange: 'Mar 2025 – Mar 2026',
    description: LocalizedText(
      'Volvero is a peer-to-peer vehicle sharing mobile application that '
          'connects vehicle owners with drivers, enabling efficient, secure, '
          'and sustainable access to cars, motorcycles, and commercial vehicles. '
          'As a core member of the Volvero Flutter team, I led multiple '
          'high-impact technical improvements across performance, security, '
          'and code quality.',
      '«ولورو» یک اپلیکیشن موبایل اشتراک خودرو همتا به همتا است که مالکان و '
          'رانندگان را به هم متصل می‌کند و دسترسی امن، کارآمد و پایدار به خودرو، '
          'موتورسیکلت و ناوگان تجاری را ممکن می‌سازد. به‌عنوان عضو اصلی تیم فلاتر '
          'ولورو، روی بهبودهای فنی مهم در عملکرد، امنیت و کیفیت کد نقش داشتم.',
    ),
    highlights: const [
      LocalizedText(
        'Performance Optimization: refactored critical parts of the Flutter '
            'codebase for better responsiveness and rendering on Android and iOS.',
        'بهینه‌سازی عملکرد: بازطراحی بخش‌های حساس کدبیس فلاتر برای پاسخگویی و '
            'رندر بهتر در اندروید و iOS.',
      ),
      LocalizedText(
        'Security Enhancements: secure data handling, input validation, '
            'dependency hardening, and runtime protections.',
        'تقویت امنیت: مدیریت امن داده، اعتبارسنجی ورودی، سخت‌سازی وابستگی‌ها و '
            'محافظت‌های زمان اجرا.',
      ),
      LocalizedText(
        'Null Safety Migration: migrated the entire project to Dart null safety, '
            'eliminating a major class of runtime errors.',
        'مهاجرت به Null Safety: انتقال کامل پروژه به null safety در Dart و '
            'کاهش خطاهای زمان اجرا.',
      ),
      LocalizedText(
        'Collaborative Development: aligned with backend, QA, and product to '
            'deliver seamless user experiences.',
        'توسعهٔ تیمی: هم‌راستایی با بک‌اند، QA و محصول برای تجربهٔ کاربری روان.',
      ),
      LocalizedText(
        'Code Quality & Scalability: enforced standards for code structure, '
            'modularization, and testability.',
        'کیفیت و مقیاس‌پذیری کد: استانداردساختار، ماژولار بودن و قابلیت تست.',
      ),
    ],
    tags: ['Flutter', 'Mobile', 'P2P', 'Performance', 'Security'],
    links: [
      _ProjectLink(
        label: 'Website',
        url: 'https://volvero.com',
        icon: Icons.public,
      ),
      _ProjectLink(
        label: 'Google Play',
        url:
            'https://play.google.com/store/apps/details?id=com.mop.volvero_app',
        icon: Icons.android,
      ),
      _ProjectLink(
        label: 'App Store',
        url:
            'https://apps.apple.com/us/app/volvero-your-car-sharing-app/id1560634513',
        icon: Icons.apple,
      ),
    ],
  ),
  _Project(
    name: 'Zaban',
    dateRange: 'Apr 2021 – Sep 2025',
    associatedWith: 'ParsPack | پارس پک',
    description: LocalizedText(
      'An interactive English learning mobile app designed to make language '
          'acquisition more engaging and enjoyable through efficient tools and '
          'gamified elements. Grew the active user base to 50,000 by delivering '
          'a seamless experience and integrating cutting-edge learning features.',
      'یک اپلیکیشن موبایل آموزش زبان انگلیسی تعاملی که با ابزارهای کارآمد و '
          'المان‌های بازی‌وار، یادگیری را جذاب‌تر می‌کند. با تمرکز بر تجربهٔ روان و '
          'امکانات یادگیری به‌روز، به رشد پایگاه فعال تا حدود ۵۰٬۰۰۰ کاربر کمک شد.',
    ),
    skills: ['Web Development', 'Computer Science', 'Flutter'],
    tags: ['Flutter', 'EdTech', 'PWA', 'Gamification'],
    links: [
      _ProjectLink(
        label: 'Zaban.com',
        url: 'https://zaban.com',
        icon: Icons.public,
      ),
      _ProjectLink(
        label: 'Google Play',
        url: 'https://play.google.com/store/apps/details?id=edu.xaban.xaban',
        icon: Icons.android,
      ),
      _ProjectLink(
        label: 'Sibapp',
        url: 'https://sibapp.com/applications/Zaban',
        icon: Icons.apple,
      ),
      _ProjectLink(label: 'PWA', url: 'https://app.zaban.io', icon: Icons.web),
      _ProjectLink(
        label: 'Cafe Bazaar',
        url: 'https://cafebazaar.ir/app/edu.xaban.xaban',
        icon: Icons.android,
      ),
      _ProjectLink(
        label: 'Myket',
        url: 'https://myket.ir/app/edu.xaban.xaban',
        icon: Icons.android,
      ),
    ],
  ),
  _Project(
    name: 'CodeWolf',
    description: LocalizedText(
      'A comprehensive management application for a programming institute '
          'built with WPF, focused on delivering an intuitive user experience '
          'through sleek, modern styling. The app streamlines administrative '
          'tasks and enhances overall efficiency for staff and students.',
      'یک نرم‌افزار جامع مدیریتی برای آموزشگاه برنامه‌نویسی با WPF با تمرکز بر '
          'تجربهٔ کاربری شهودی و ظاهر مدرن؛ فرایندهای اداری را ساده‌تر و کارایی '
          'کارکنان و هنرجویان را بالا می‌برد.',
    ),
    skills: ['WPF', 'C#', 'Computer Science'],
    tags: ['Desktop', 'Windows', 'WPF', 'C#'],
    links: [
      _ProjectLink(
        label: 'GitHub',
        url: 'https://github.com/hasanm08/CodeWolf',
        icon: Icons.code,
      ),
    ],
  ),
  _Project(
    name: 'PayBay',
    description: LocalizedText(
      'A cross-platform Buy Now Pay Later (BNPL) service built with Flutter, '
          'providing a seamless and secure payment experience across devices. '
          'Features a clean, user-friendly interface and integrates with '
          'multiple payment gateways for flexible purchase management.',
      'سرویس «خرید الان، پرداخت بعد» چندسکویی با فلاتر با تجربهٔ پرداخت امن و '
          'یکدست روی دستگاه‌های مختلف؛ رابط کاربری تمیز و اتصال به درگاه‌های متعدد '
          'برای مدیریت انعطاف‌پذیر خرید.',
    ),
    skills: ['Flutter', 'Computer Science'],
    tags: ['Flutter', 'FinTech', 'BNPL', 'Payments'],
  ),
  _Project(
    name: 'Travel App',
    description: LocalizedText(
      'A simple Flutter MVP for a travel services platform with an intuitive '
          'interface to browse, book, and manage travel plans. Focused on core '
          'functionality and optimized performance across devices for a '
          'streamlined experience.',
      'یک MVP فلاتر برای پلتفرم خدمات سفر با رابط کاربری شهودی برای مرور، '
          'رزرو و مدیریت برنامه‌های سفر؛ تمرکز بر هستهٔ محصول و عملکرد بهینه روی '
          'دستگاه‌های مختلف.',
    ),
    skills: ['Flutter', 'Computer Science'],
    tags: ['Flutter', 'Travel', 'MVP'],
    links: [
      _ProjectLink(
        label: 'GitHub',
        url: 'https://github.com/hasanm08/travel-app',
        icon: Icons.code,
      ),
    ],
  ),
  _Project(
    name: 'HabitForge',
    description: LocalizedText(
      'An AI-powered habit tracking platform built with Flutter using scalable '
          'feature-based architecture and modern software engineering practices. '
          'Implements habit scheduling, recurring tasks, progress analytics, streak '
          'tracking, notifications, and home screen widgets with a strong focus on '
          'performance, maintainability, and user experience. Designed for future '
          'SaaS expansion with offline-first capabilities, extensible state '
          'management, and reusable UI components.',
      'پلتفرم ردیابی عادت مبتنی بر هوش مصنوعی با فلاتر و معماری مقیاس‌پذیر '
          'feature-based. شامل زمان‌بندی عادت، کارهای تکراری، تحلیل پیشرفت، '
          'ردیابی streak، اعلان‌ها و ویجت‌های صفحهٔ اصلی با تمرکز بر عملکرد، '
          'نگهداری‌پذیری و تجربهٔ کاربری. طراحی‌شده برای توسعهٔ آیندهٔ SaaS با '
          'قابلیت offline-first، مدیریت state قابل گسترش و کامپوننت‌های UI قابل '
          'استفادهٔ مجدد.',
    ),
    highlights: const [
      LocalizedText(
        'Designed a scalable feature-based architecture following Clean '
            'Architecture principles.',
        'طراحی معماری مقیاس‌پذیر feature-based بر اساس اصول Clean Architecture.',
      ),
      LocalizedText(
        'Built reusable UI components and modular business logic.',
        'ساخت کامپوننت‌های UI قابل استفادهٔ مجدد و منطق کسب‌وکار ماژولار.',
      ),
      LocalizedText(
        'Implemented habit scheduling, reminders, streaks, and analytics.',
        'پیاده‌سازی زمان‌بندی عادت، یادآورها، streakها و تحلیل‌ها.',
      ),
      LocalizedText(
        'Optimized application performance and smooth animations.',
        'بهینه‌سازی عملکرد اپلیکیشن و انیمیشن‌های روان.',
      ),
      LocalizedText(
        'Developed a responsive cross-platform Flutter app for Android, iOS, '
            'and Web readiness.',
        'توسعهٔ اپلیکیشن فلاتر واکنش‌گرا برای اندروید، iOS و آمادگی وب.',
      ),
      LocalizedText(
        'Integrated local persistence, state management, and extensible domain '
            'models for future cloud synchronization.',
        'یکپارچه‌سازی persistence محلی، مدیریت state و مدل‌های دامنهٔ قابل '
            'گسترش برای همگام‌سازی ابری آینده.',
      ),
    ],
    skills: ['Flutter', 'Dart', 'Clean Architecture'],
    tags: [
      'Flutter',
      'Dart',
      'Clean Architecture',
      'Habits',
      'Cross-Platform',
      'Unpublished',
    ],
  ),
  _Project(
    name: 'Flow Ledger',
    description: LocalizedText(
      'A lightweight accounting solution for individuals and small businesses '
          'that simplifies financial management through invoice generation, '
          'inventory tracking, expense and income management, and business '
          'analytics. Built with a modular Flutter architecture emphasizing '
          'maintainability, scalability, and intuitive user experience.',
      'راه‌حل حسابداری سبک‌وزن برای افراد و کسب‌وکارهای کوچک که مدیریت مالی را '
          'با صدور فاکتور، ردیابی موجودی، مدیریت هزینه و درآمد و تحلیل کسب‌وکار '
          'ساده می‌کند. با معماری ماژولار فلاتر و تمرکز بر نگهداری‌پذیری، '
          'مقیاس‌پذیری و تجربهٔ کاربری شهودی ساخته شده است.',
    ),
    highlights: const [
      LocalizedText(
        'Developed invoice generation and customer management modules.',
        'توسعهٔ ماژول‌های صدور فاکتور و مدیریت مشتری.',
      ),
      LocalizedText(
        'Implemented inventory and stock tracking.',
        'پیاده‌سازی ردیابی موجودی و انبار.',
      ),
      LocalizedText(
        'Built expense, income, and cash flow management features.',
        'ساخت قابلیت‌های مدیریت هزینه، درآمد و جریان نقدی.',
      ),
      LocalizedText(
        'Created interactive dashboards and financial reports with charts.',
        'ایجاد داشبوردهای تعاملی و گزارش‌های مالی با نمودار.',
      ),
      LocalizedText(
        'Designed reusable architecture supporting future cloud synchronization '
            'and multi-business support.',
        'طراحی معماری قابل استفادهٔ مجدد برای همگام‌سازی ابری و پشتیبانی چند '
            'کسب‌وکار در آینده.',
      ),
      LocalizedText(
        'Focused on performance, clean code practices, and responsive UI across '
            'mobile platforms.',
        'تمرکز بر عملکرد، کد تمیز و رابط کاربری واکنش‌گرا در پلتفرم‌های موبایل.',
      ),
    ],
    skills: ['Flutter', 'Inventory Management', 'Invoicing', 'Analytics'],
    tags: [
      'Flutter',
      'Accounting',
      'Inventory',
      'Invoicing',
      'Analytics',
      'Unpublished',
    ],
  ),
];

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project, required this.isCompact});

  final _Project project;
  final bool isCompact;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final project = widget.project;
    final isCompact = widget.isCompact;
    final titleStyle = TextStyle(
      fontSize: isCompact ? 20 : 24,
      fontFamily: 'Exo2',
      color: scheme.primary,
      letterSpacing: isCompact ? 0.6 : 1.0,
      fontWeight: FontWeight.w600,
    );
    final metaStyle = TextStyle(
      fontSize: isCompact ? 12 : 13,
      fontFamily: 'Exo2',
      color: scheme.onSurface.withValues(alpha: 0.65),
      fontStyle: FontStyle.italic,
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
              Text(project.name, style: titleStyle),
              if (project.dateRange != null) ...[
                const SizedBox(height: 4),
                Text(project.dateRange!, style: metaStyle),
              ],
              if (project.associatedWith != null) ...[
                const SizedBox(height: 2),
                Text(
                  '${l10n.associatedWithPrefix} ${project.associatedWith!}',
                  style: metaStyle,
                ),
              ],
              const SizedBox(height: 12),
              Text(project.description.resolve(locale), style: bodyStyle),
              if (project.highlights.isNotEmpty) ...[
                const SizedBox(height: 12),
                ...project.highlights.map(
                  (h) => Padding(
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
                          child: Text(h.resolve(locale), style: bodyStyle),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (project.skills.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  '${l10n.skillsPrefix}: ${project.skills.join(', ')}',
                  style: bodyStyle.copyWith(
                    color: scheme.onSurface.withValues(alpha: 0.65),
                    fontSize: isCompact ? 13 : 14,
                  ),
                ),
              ],
              if (project.tags.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tag in project.tags) _TagChip(label: tag),
                  ],
                ),
              ],
              if (project.links.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final link in project.links)
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

  final _ProjectLink link;
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
