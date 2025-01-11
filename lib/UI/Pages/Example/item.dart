import 'package:flutter/material.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class Item extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final bool? selected;
  const Item({Key? key, this.icon, this.text, this.selected}) : super(key: key);
  @override
  ItemState createState() => ItemState();
}

class ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: widget.selected!
          ? BoxDecoration(
              color: Colors.white.withValues(alpha: .30),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: ExampleUtils.width(context) * .025,
          ),
          Text(
            widget.text!,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
