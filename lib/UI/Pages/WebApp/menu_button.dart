import 'package:flow_routing/flow_routing.dart';
import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';

class MenuButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final FlowRoute route;
  final bool isSelected;

  const MenuButton({
    super.key,
    required this.text,
    required this.icon,
    required this.route,
    required this.isSelected,
  });

  @override
  MenuButtonState createState() => MenuButtonState();
}

class MenuButtonState extends State<MenuButton> {
  bool _hovering = false;

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = widget.isSelected || _hovering;
    return SizedBox(
      height: 60,
      width: 160,
      child: FocusableActionDetector(
        onShowHoverHighlight: _handleHoveHighlight,
        child: AnimatedScale(
          scale: active ? 1.02 : 1,
          duration: PortfolioMotion.medium,
          curve: PortfolioMotion.standard,
          child: AnimatedContainer(
            duration: PortfolioMotion.medium,
            curve: PortfolioMotion.standard,
            margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            decoration: BoxDecoration(
              color: active ? scheme.onPrimary : scheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: active
                  ? [
                      BoxShadow(
                        color: scheme.shadow.withValues(alpha: 0.16),
                        blurRadius: 14,
                        offset: const Offset(2, 4),
                      ),
                    ]
                  : null,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                animationDuration: PortfolioMotion.fast,
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                padding: const EdgeInsets.all(12),
                foregroundColor: active ? scheme.primary : scheme.onPrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                context.go(widget.route);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedContainer(
                    duration: PortfolioMotion.medium,
                    curve: PortfolioMotion.standard,
                    transform: Matrix4.translationValues(
                      active ? 4 : 0,
                      0,
                      0,
                    ),
                    child: Icon(
                      widget.icon,
                      color: active ? scheme.primary : scheme.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedDefaultTextStyle(
                    duration: PortfolioMotion.medium,
                    curve: PortfolioMotion.standard,
                    style: TextStyle(
                      color: active ? scheme.primary : scheme.onPrimary,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    ),
                    child: Text(widget.text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
