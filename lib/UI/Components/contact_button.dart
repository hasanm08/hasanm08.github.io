import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Components/portfolio_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatefulWidget {
  const ContactButton({
    super.key,
    this.color,
    required this.icon,
    required this.link,
    required this.title,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final String link;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  ContactButtonState createState() => ContactButtonState();
}

class ContactButtonState extends State<ContactButton> {
  bool _hovering = false;

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = widget.color ?? scheme.primary;

    return FocusableActionDetector(
      onShowHoverHighlight: _handleHoveHighlight,
      child: AnimatedScale(
        scale: _hovering ? 1.04 : 1,
        duration: PortfolioMotion.medium,
        curve: PortfolioMotion.standard,
        child: AnimatedContainer(
          duration: PortfolioMotion.medium,
          curve: PortfolioMotion.standard,
          margin: const EdgeInsets.all(8),
          height: 55,
          width: 150,
          decoration: BoxDecoration(
            color: _hovering ? accent : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: accent, width: 1),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.28),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
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
              padding: const EdgeInsets.all(8),
              foregroundColor: _hovering ? scheme.onPrimary : accent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            onPressed: widget.onPressed ?? () async => _showUrl(widget.link),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedRotation(
                  turns: _hovering ? 0.04 : 0,
                  duration: PortfolioMotion.medium,
                  curve: PortfolioMotion.standard,
                  child: Icon(
                    widget.icon,
                    color: _hovering
                        ? scheme.onPrimary
                        : scheme.onSurface.withValues(alpha: 0.92),
                  ),
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _hovering
                            ? scheme.onPrimary
                            : scheme.onSurface.withValues(alpha: 0.92),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
