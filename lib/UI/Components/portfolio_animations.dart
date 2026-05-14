import 'package:flutter/material.dart';

/// Motion tuned for calm, high‑polish entrances (easeOutQuint, subtle offsets).
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
    final n = widget.itemCount.clamp(1, 999);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 640 + (widget.itemCount * 72).clamp(0, 1800),
      ),
    );
    _animations = List.generate(widget.itemCount, (i) {
      final start = (i / (n + 1.35)).clamp(0.0, 0.88);
      final end = (start + 0.38).clamp(0.14, 1.0);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutQuint),
        reverseCurve: Interval(start, end, curve: Curves.easeInQuart),
      );
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: widget.scrollController,
      physics: widget.physics,
      padding: widget.padding,
      itemCount: widget.itemCount,
      separatorBuilder: widget.separatorBuilder,
      itemBuilder: (context, index) {
        final anim = _animations[index];
        return FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.028),
              end: Offset.zero,
            ).animate(anim),
            child: widget.itemBuilder(context, index),
          ),
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
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

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
    final n = widget.children.length.clamp(1, 999);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 520 + (widget.children.length * 78).clamp(0, 2000),
      ),
    );
    _animations = List.generate(widget.children.length, (i) {
      final start = (i / (n + 1.2)).clamp(0.0, 0.86);
      final end = (start + 0.4).clamp(0.12, 1.0);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutQuint),
        reverseCurve: Interval(start, end, curve: Curves.easeInQuart),
      );
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: List.generate(widget.children.length, (i) {
        final anim = _animations[i];
        return FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.032),
              end: Offset.zero,
            ).animate(anim),
            child: widget.children[i],
          ),
        );
      }),
    );
  }
}
