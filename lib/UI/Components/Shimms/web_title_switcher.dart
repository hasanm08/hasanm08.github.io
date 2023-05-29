// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

class WebTitleSwitcher extends StatefulWidget {
  const WebTitleSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<WebTitleSwitcher> createState() => _WebTitleSwitcherState();
}

class _WebTitleSwitcherState extends State<WebTitleSwitcher> {
  bool _isTabActive = true;

  @override
  void initState() {
    super.initState();
    // Register a blur event listener on the window object
    html.window.addEventListener('blur', _handleBlurEvent);
    html.window.addEventListener('focus', _handleFocusEvent);
  }

  @override
  void dispose() {
    // Remove the event listeners when the widget is disposed
    html.window.removeEventListener('blur', _handleBlurEvent);
    html.window.removeEventListener('focus', _handleFocusEvent);
    super.dispose();
  }

  void _handleBlurEvent(html.Event event) {
    setState(() {
      _isTabActive = false;
    });
    _updateTabTitle();
  }

  void _handleFocusEvent(html.Event event) {
    setState(() {
      _isTabActive = true;
    });
    _updateTabTitle();
  }

  void _updateTabTitle() {
    final String title = _isTabActive ? "hasanm08" : "Come back ;(";
    html.document.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
