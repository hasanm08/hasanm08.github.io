import 'package:flutter/material.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class TagComponent extends StatelessWidget {
  final String? label;
  final Widget? avatar;

  const TagComponent({Key? key, this.avatar, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: RawChip(
        label: Text(
          label!,
        ),
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.black),
        avatar: avatar,
        backgroundColor: ExampleUtils.chipBackground(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
