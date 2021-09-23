import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatefulWidget {
  ContactButton(
      {this.color = Colors.blue,
      required this.icon,
      required this.link,
      required this.title});
  final IconData icon;
  final String title;
  final String link;
  final Color? color;

  @override
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _hovering = false;

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: _handleHoveHighlight,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 55,
        width: 150,
        decoration: BoxDecoration(
            color: _hovering ? widget.color : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: widget.color!, width: 1)),
        child: TextButton(
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              animationDuration: const Duration(microseconds: 200),
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w700),
              padding: EdgeInsets.all(8),
              shadowColor: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              )),
          onPressed: () async => await _showUrl(widget.link),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                widget.icon,
                color: _hovering ? Colors.white : widget.color,
              ),
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: _hovering ? Colors.white : widget.color),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
