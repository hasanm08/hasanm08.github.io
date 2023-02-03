import 'package:flutter/material.dart';
import 'package:hasanm08/blocs/menuBloc.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatefulWidget {
  final int? index;
  final String? text;
  final IconData? icon;
  const MenuButton(
      {@required this.icon, @required this.text, @required this.index});

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _hovering = false;
  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<MenuBloc, int>(
      selector: (_, bloc) => bloc.index,
      builder: (context, value, child) => SizedBox(
        height: 60,
        width: 160,
        child: FocusableActionDetector(
          onShowHoverHighlight: _handleHoveHighlight,
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            decoration: BoxDecoration(
                border: null,
                color: value == widget.index || _hovering
                    ? Colors.white
                    : Colors.blue,
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
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w700),
                  padding: const EdgeInsets.all(12),
                  shadowColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ))),
              onPressed: () {
                Provider.of<MenuBloc>(context, listen: false)
                    .setIndex(widget.index!);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    widget.icon,
                    color: !(value == widget.index || _hovering)
                        ? Colors.white
                        : Colors.blue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.text!,
                    style: TextStyle(
                        color: !(value == widget.index || _hovering)
                            ? Colors.white
                            : Colors.blue),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
