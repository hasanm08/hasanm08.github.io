import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  static const double _wideBreakpoint = 960;

  @override
  Widget build(BuildContext context) {
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
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Projects',
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontSize: isWide ? 30 : 24,
                      color: Colors.blue,
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
  final String description;
  final List<String> skills;
  final List<String> tags;
  final List<String> highlights;
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

const List<_Project> _projects = [
  _Project(
    name: 'Volvero',
    dateRange: 'Mar 2025 – Mar 2026',
    description:
        'Volvero is a peer-to-peer vehicle sharing mobile application that '
        'connects vehicle owners with drivers, enabling efficient, secure, '
        'and sustainable access to cars, motorcycles, and commercial vehicles. '
        'As a core member of the Volvero Flutter team, I led multiple '
        'high-impact technical improvements across performance, security, '
        'and code quality.',
    highlights: [
      'Performance Optimization: refactored critical parts of the Flutter '
          'codebase for better responsiveness and rendering on Android and iOS.',
      'Security Enhancements: secure data handling, input validation, '
          'dependency hardening, and runtime protections.',
      'Null Safety Migration: migrated the entire project to Dart null safety, '
          'eliminating a major class of runtime errors.',
      'Collaborative Development: aligned with backend, QA, and product to '
          'deliver seamless user experiences.',
      'Code Quality & Scalability: enforced standards for code structure, '
          'modularization, and testability.',
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
    description:
        'An interactive English learning mobile app designed to make language '
        'acquisition more engaging and enjoyable through efficient tools and '
        'gamified elements. Grew the active user base to 50,000 by delivering '
        'a seamless experience and integrating cutting-edge learning features.',
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
      _ProjectLink(
        label: 'PWA',
        url: 'https://app.zaban.io',
        icon: Icons.web,
      ),
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
    description:
        'A comprehensive management application for a programming institute '
        'built with WPF, focused on delivering an intuitive user experience '
        'through sleek, modern styling. The app streamlines administrative '
        'tasks and enhances overall efficiency for staff and students.',
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
    description:
        'A cross-platform Buy Now Pay Later (BNPL) service built with Flutter, '
        'providing a seamless and secure payment experience across devices. '
        'Features a clean, user-friendly interface and integrates with '
        'multiple payment gateways for flexible purchase management.',
    skills: ['Flutter', 'Computer Science'],
    tags: ['Flutter', 'FinTech', 'BNPL', 'Payments'],
  ),
  _Project(
    name: 'Travel App',
    description:
        'A simple Flutter MVP for a travel services platform with an intuitive '
        'interface to browse, book, and manage travel plans. Focused on core '
        'functionality and optimized performance across devices for a '
        'streamlined experience.',
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
];

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
    required this.isCompact,
  });

  final _Project project;
  final bool isCompact;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isCompact = widget.isCompact;
    final titleStyle = TextStyle(
      fontSize: isCompact ? 20 : 24,
      fontFamily: 'Exo2',
      color: Colors.blue,
      letterSpacing: isCompact ? 0.6 : 1.0,
      fontWeight: FontWeight.w600,
    );
    final metaStyle = TextStyle(
      fontSize: isCompact ? 12 : 13,
      fontFamily: 'Exo2',
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    );
    final bodyStyle = TextStyle(
      fontSize: isCompact ? 14 : 16,
      fontFamily: 'Exo2',
      color: Colors.black87,
      height: 1.4,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.008 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: const Color(0x14000000),
                blurRadius: _hover ? 22 : 12,
                offset: Offset(0, _hover ? 10 : 4),
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
                  'Associated with ${project.associatedWith!}',
                  style: metaStyle,
                ),
              ],
              const SizedBox(height: 12),
              Text(project.description, style: bodyStyle),
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
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: Text(h, style: bodyStyle)),
                      ],
                    ),
                  ),
                ),
              ],
              if (project.skills.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  'Skills: ${project.skills.join(', ')}',
                  style: bodyStyle.copyWith(
                    color: Colors.black54,
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
                      _LinkButton(link: link, isCompact: isCompact),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.4)),
      ),
      child: Text(
        '#$label',
        style: const TextStyle(
          fontFamily: 'Exo2',
          fontSize: 12,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  const _LinkButton({required this.link, required this.isCompact});

  final _ProjectLink link;
  final bool isCompact;

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _open,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
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
                color: _hovering ? Colors.white : color,
              ),
              const SizedBox(width: 6),
              Text(
                widget.link.label,
                style: TextStyle(
                  fontFamily: 'Exo2',
                  fontSize: widget.isCompact ? 13 : 14,
                  color: _hovering ? Colors.white : color,
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
