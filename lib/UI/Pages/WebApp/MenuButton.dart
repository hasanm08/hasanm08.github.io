import 'package:flutter/material.dart';
import 'package:hasanm08/blocs/menuBloc.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatefulWidget {
  final int? index;
  final String? text;
  final IconData? icon;
  MenuButton({@required this.icon, @required this.text, @required this.index});

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
      builder: (context, value, child) => Container(
        height: 60,
        width: 160,
        child: FocusableActionDetector(
          onShowHoverHighlight: _handleHoveHighlight,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
              decoration: BoxDecoration(
                  border: null,
                  color: value == widget.index || _hovering
                      ? Colors.white
                      : Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    widget.icon,
                    color: !(value == widget.index || _hovering)
                        ? Colors.white
                        : Colors.blue,
                  ),
                  SizedBox(
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
            onTap: () {
              Provider.of<MenuBloc>(context, listen: false)
                  .setIndex(widget.index!);
            },
          ),
        ),
      ),
    );
  }
}
