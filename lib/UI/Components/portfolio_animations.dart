import 'package:flutter/material.dart';

/// Shared motion tokens — keep durations and curves consistent site-wide.
abstract final class PortfolioMotion {
  static const Duration fast = Duration(milliseconds: 280);
  static const Duration medium = Duration(milliseconds: 420);
  static const Duration slow = Duration(milliseconds: 560);

  static const Curve standard = Curves.easeOutCubic;
  static const Curve entrance = Curves.easeOutQuint;
  static const Curve exit = Curves.easeInCubic;

  static bool shouldAnimate(BuildContext context) {
    return !MediaQuery.disableAnimationsOf(context);
  }
}

/// Fade + slide + subtle scale entrance used by stagger helpers.
class PortfolioEntrance extends StatelessWidget {
  const PortfolioEntrance({
    super.key,
    required this.animation,
    required this.child,
    this.slideOffset = const Offset(0, 0.028),
    this.scaleBegin = 0.97,
    this.enableScale = true,
  });

  final Animation<double> animation;
  final Widget child;
  final Offset slideOffset;
  final double scaleBegin;
  final bool enableScale;

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(
      parent: animation,
      curve: PortfolioMotion.entrance,
      reverseCurve: PortfolioMotion.exit,
    );
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: slideOffset,
          end: Offset.zero,
        ).animate(curved),
        child: enableScale && scaleBegin < 1
            ? ScaleTransition(
                scale: Tween<double>(begin: scaleBegin, end: 1).animate(curved),
                child: child,
              )
            : child,
      ),
    );
  }
}

List<Animation<double>> _staggerAnimations({
  required AnimationController controller,
  required int count,
  double overlap = 0.38,
  double divisor = 1.35,
}) {
  final n = count.clamp(1, 999);
  return List.generate(count, (i) {
    final start = (i / (n + divisor)).clamp(0.0, 0.88);
    final end = (start + overlap).clamp(0.14, 1.0);
    return CurvedAnimation(
      parent: controller,
      curve: Interval(start, end, curve: PortfolioMotion.entrance),
      reverseCurve: Interval(start, end, curve: PortfolioMotion.exit),
    );
  });
}

/// Motion tuned for calm, high-polish entrances (easeOutQuint, subtle offsets).
class PortfolioStaggeredListView extends StatefulWidget {
  const PortfolioStaggeredListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    this.physics,
    this.scrollController,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;

  @override
  State<PortfolioStaggeredListView> createState() =>
      _PortfolioStaggeredListViewState();
}

class _PortfolioStaggeredListViewState extends State<PortfolioStaggeredListView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 640 + (widget.itemCount * 72).clamp(0, 1800),
      ),
    );
    _animations = _staggerAnimations(
      controller: _controller,
      count: widget.itemCount,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!PortfolioMotion.shouldAnimate(context)) {
      return ListView.separated(
        controller: widget.scrollController,
        physics: widget.physics,
        padding: widget.padding,
        itemCount: widget.itemCount,
        separatorBuilder: widget.separatorBuilder,
        itemBuilder: widget.itemBuilder,
      );
    }

    return ListView.separated(
      controller: widget.scrollController,
      physics: widget.physics,
      padding: widget.padding,
      itemCount: widget.itemCount,
      separatorBuilder: widget.separatorBuilder,
      itemBuilder: (context, index) {
        return PortfolioEntrance(
          animation: _animations[index],
          child: widget.itemBuilder(context, index),
        );
      },
    );
  }
}

/// Staggered entrance for a [Column] of blocks (e.g. About page).
class PortfolioStaggeredColumn extends StatefulWidget {
  const PortfolioStaggeredColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.scaleDisabledIndices = const {},
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Set<int> scaleDisabledIndices;

  @override
  State<PortfolioStaggeredColumn> createState() =>
      _PortfolioStaggeredColumnState();
}

class _PortfolioStaggeredColumnState extends State<PortfolioStaggeredColumn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 520 + (widget.children.length * 78).clamp(0, 2000),
      ),
    );
    _animations = _staggerAnimations(
      controller: _controller,
      count: widget.children.length,
      overlap: 0.4,
      divisor: 1.2,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!PortfolioMotion.shouldAnimate(context)) {
      return Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        mainAxisSize: widget.mainAxisSize,
        children: widget.children,
      );
    }

    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: List.generate(widget.children.length, (i) {
        return PortfolioEntrance(
          animation: _animations[i],
          enableScale: !widget.scaleDisabledIndices.contains(i),
          child: widget.children[i],
        );
      }),
    );
  }
}

/// Staggered entrance for [Wrap] layouts (e.g. Contact buttons).
class PortfolioStaggeredWrap extends StatefulWidget {
  const PortfolioStaggeredWrap({
    super.key,
    required this.children,
    this.alignment = WrapAlignment.center,
    this.spacing = 0,
    this.runSpacing = 0,
  });

  final List<Widget> children;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;

  @override
  State<PortfolioStaggeredWrap> createState() => _PortfolioStaggeredWrapState();
}

class _PortfolioStaggeredWrapState extends State<PortfolioStaggeredWrap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 480 + (widget.children.length * 55).clamp(0, 1600),
      ),
    );
    _animations = _staggerAnimations(
      controller: _controller,
      count: widget.children.length,
      overlap: 0.42,
      divisor: 1.1,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = PortfolioMotion.shouldAnimate(context)
        ? List.generate(widget.children.length, (i) {
            return PortfolioEntrance(
              animation: _animations[i],
              slideOffset: const Offset(0, 0.04),
              scaleBegin: 0.94,
              child: widget.children[i],
            );
          })
        : widget.children;

    return Wrap(
      alignment: widget.alignment,
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: children,
    );
  }
}

/// Sidebar slide-in for the desktop shell.
class PortfolioSidebarReveal extends StatefulWidget {
  const PortfolioSidebarReveal({
    super.key,
    required this.child,
    this.slideFrom = const Offset(-0.12, 0),
  });

  final Widget child;
  final Offset slideFrom;

  @override
  State<PortfolioSidebarReveal> createState() => _PortfolioSidebarRevealState();
}

class _PortfolioSidebarRevealState extends State<PortfolioSidebarReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: PortfolioMotion.slow,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!PortfolioMotion.shouldAnimate(context)) {
      return widget.child;
    }

    final curved = CurvedAnimation(
      parent: _controller,
      curve: PortfolioMotion.entrance,
    );
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.slideFrom,
        end: Offset.zero,
      ).animate(curved),
      child: FadeTransition(
        opacity: curved,
        child: widget.child,
      ),
    );
  }
}

/// Gentle lift + scale on pointer hover — for cards and buttons.
class PortfolioHoverLift extends StatefulWidget {
  const PortfolioHoverLift({
    super.key,
    required this.child,
    this.lift = 4,
    this.scale = 1.02,
    this.duration = PortfolioMotion.medium,
  });

  final Widget child;
  final double lift;
  final double scale;
  final Duration duration;

  @override
  State<PortfolioHoverLift> createState() => _PortfolioHoverLiftState();
}

class _PortfolioHoverLiftState extends State<PortfolioHoverLift> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1,
        duration: widget.duration,
        curve: PortfolioMotion.standard,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: PortfolioMotion.standard,
          transform: Matrix4.translationValues(0, _hovering ? -widget.lift : 0, 0),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Page transition builder shared by [GoRouter] shell routes.
Widget portfolioPageTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  if (!PortfolioMotion.shouldAnimate(context)) {
    return child;
  }

  final curved = CurvedAnimation(
    parent: animation,
    curve: PortfolioMotion.entrance,
    reverseCurve: PortfolioMotion.exit,
  );
  final fade = Tween<double>(begin: 0, end: 1).animate(curved);
  final slide = Tween<Offset>(
    begin: const Offset(0.018, 0),
    end: Offset.zero,
  ).animate(curved);
  final scale = Tween<double>(begin: 0.985, end: 1).animate(curved);

  return FadeTransition(
    opacity: fade,
    child: SlideTransition(
      position: slide,
      child: ScaleTransition(
        scale: scale,
        child: child,
      ),
    ),
  );
}
