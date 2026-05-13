import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final String route;
  final bool isSelected;

  const MenuButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.route,
    required this.isSelected,
  }) : super(key: key);

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
    final active = widget.isSelected || _hovering;
    return SizedBox(
      height: 60,
      width: 160,
      child: FocusableActionDetector(
        onShowHoverHighlight: _handleHoveHighlight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          decoration: BoxDecoration(
              border: null,
              color: active ? Colors.white : Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )),
          child: TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                animationDuration: const Duration(microseconds: 200),
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700),
                padding: const EdgeInsets.all(12),
                shadowColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ))),
            onPressed: () {
              context.go(widget.route);
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  widget.icon,
                  color: !active ? Colors.white : Colors.blue,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.text,
                  style: TextStyle(color: !active ? Colors.white : Colors.blue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
