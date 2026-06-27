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
    final size = widget.size ?? 300.0;
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
            final tiltRadians = hover * 5 * (pi / 180);
            final floatY = animate && hover < 0.02
                ? sin(_floatController.value * 2 * pi) * 4
                : 0.0;
            final characterVisible = hover > 0.001;

            return Transform.translate(
              offset: Offset(0, floatY),
              child: SizedBox(
                width: size,
                height: size,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Opacity(
                      opacity: 1 - hover,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-tiltRadians),
                        child: ClipOval(
                          child: Image.asset(
                            widget.coverImage,
                            fit: BoxFit.cover,
                            width: size,
                            height: size,
                          ),
                        ),
                      ),
                    ),
                    if (characterVisible)
                      Opacity(
                        opacity: hover,
                        child: Padding(
                          padding: EdgeInsets.all(8 * hover),
                          child: Image.asset(
                            widget.characterImage,
                            fit: BoxFit.contain,
                            width: size,
                            height: size,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
