import 'dart:ui';

import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/l10n/app_localizations.dart';
import 'package:hasanm08/providers/app_settings.dart';
import 'package:hasanm08/routes/app_routes.dart';
import 'package:provider/provider.dart';

/// Full-screen route miss page: respects [AppSettings] theme & locale (MaterialApp).
class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double> _floatY;
  late final Animation<double> _glow;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
    _floatY = Tween<double>(begin: -6, end: 10).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOutCubic),
    );
    _glow = Tween<double>(begin: 0.22, end: 0.55).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final routerState = context.routeState;
    final path = routerState.uri.path;
    final query = routerState.uri.query;
    final fullPath = query.isEmpty ? path : '$path?$query';
    final canPop = context.canPop();

    final body = Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        actions: [
          Consumer<AppSettings>(
            builder: (context, settings, _) {
              return IconButton(
                tooltip: l10n.themeTooltip,
                onPressed: settings.cycleTheme,
                icon: Icon(_themeIcon(settings.themeMode)),
              );
            },
          ),
          Consumer<AppSettings>(
            builder: (context, settings, _) {
              return IconButton(
                tooltip: l10n.languageTooltip,
                onPressed: settings.toggleLocale,
                icon: Text(
                  settings.locale.languageCode == 'fa' ? 'فا' : 'EN',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Exo2',
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(scheme.surface, scheme.primaryContainer, 0.35)!,
                  scheme.surface,
                  Color.lerp(scheme.surface, scheme.tertiaryContainer, 0.28)!,
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -30,
            child: _Blob(color: scheme.primary.withValues(alpha: 0.14)),
          ),
          Positioned(
            bottom: 40,
            left: -50,
            child: _Blob(
              color: scheme.tertiary.withValues(alpha: 0.12),
              size: 260,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 88, 24, 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _pulse,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _floatY.value),
                          child: child,
                        );
                      },
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              colors: [
                                scheme.primary,
                                scheme.tertiary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds);
                          },
                          child: Text(
                            '404',
                            textAlign: TextAlign.center,
                            style: textTheme.displayLarge?.copyWith(
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 112,
                                  height: 1.0,
                                  color: Colors.white,
                                ) ??
                                const TextStyle(
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 112,
                                  height: 1.0,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.notFoundTitle,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.notFoundSubtitle,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.78),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 28),
                    AnimatedBuilder(
                      animation: _glow,
                      builder: (context, _) {
                        return Material(
                          color: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: scheme.outline.withValues(
                                  alpha: 0.35 + _glow.value * 0.25,
                                ),
                              ),
                              color: scheme.surfaceContainerHighest
                                  .withValues(alpha: 0.55),
                              boxShadow: [
                                BoxShadow(
                                  color: scheme.primary.withValues(
                                    alpha: 0.08 + _glow.value * 0.12,
                                  ),
                                  blurRadius: 22,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.link_off_rounded,
                                  color: scheme.primary,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.notFoundPathLabel,
                                        style: textTheme.labelMedium?.copyWith(
                                          color: scheme.onSurface
                                              .withValues(alpha: 0.65),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      SelectableText(
                                        fullPath.isEmpty ? '/' : fullPath,
                                        style: textTheme.titleSmall?.copyWith(
                                          fontFamily: 'monospace',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        FilledButton.icon(
                          onPressed: () => context.go(const AboutRoute()),
                          icon: const Icon(Icons.home_outlined),
                          label: Text(l10n.notFoundHomeCta),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 14,
                            ),
                          ),
                        ),
                        if (canPop)
                          OutlinedButton.icon(
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back_rounded),
                            label: Text(l10n.notFoundGoBack),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 14,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    if (!l10n.isFa) {
      return body;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: body,
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

class _Blob extends StatelessWidget {
  const _Blob({
    required this.color,
    this.size = 200,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          width: size,
          height: size,
          color: color,
        ),
      ),
    );
  }
}
