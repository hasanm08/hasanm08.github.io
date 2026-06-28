import 'dart:math' show pi, sin;

import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';

class CustomAnimated3DCard extends StatefulWidget {
  final String characterImage;
  final String coverImage;
  final double? size;

  const CustomAnimated3DCard({
    super.key,
    required this.characterImage,
    required this.coverImage,
    this.size,
  });

  @override
  CustomAnimated3DCardState createState() => CustomAnimated3DCardState();
}

class CustomAnimated3DCardState extends State<CustomAnimated3DCard>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _floatController;
  late Animation<double> _hover;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: PortfolioMotion.medium,
      reverseDuration: PortfolioMotion.fast,
    );
    _hover = CurvedAnimation(
      parent: _hoverController,
      curve: PortfolioMotion.entrance,
      reverseCurve: PortfolioMotion.exit,
    );
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat();
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  void _setHover(bool hovered) {
    if (hovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = 300.0;
    final animate = PortfolioMotion.shouldAnimate(context);

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: () {
          if (_hoverController.isCompleted) {
            _hoverController.reverse();
          } else {
            _hoverController.forward();
          }
        },
        child: AnimatedBuilder(
          animation: Listenable.merge([_hover, _floatController]),
          builder: (context, child) {
            final hover = _hover.value;

            final floatY = animate && hover < 0.02
                ? sin(_floatController.value * 2 * pi) * 4
                : 0.0;
            return Transform.translate(
              offset: Offset(0, floatY),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.hardEdge,
                children: [
                  Image.asset(
                    widget.characterImage,
                    fit: BoxFit.contain,
                    width: size,
                    height: size,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
