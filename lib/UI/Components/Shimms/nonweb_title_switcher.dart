// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class WebTitleSwitcher extends StatelessWidget {
  const WebTitleSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
