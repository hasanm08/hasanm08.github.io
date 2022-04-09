import 'package:flutter/cupertino.dart';
import 'package:hasanm08/UI/Pages/WebApp/about.dart';
import 'package:hasanm08/UI/Pages/WebApp/contact.dart';
import 'package:hasanm08/UI/Pages/WebApp/more.dart';
import 'package:hasanm08/UI/Pages/WebApp/projects.dart';

class MenuBloc with ChangeNotifier {
  final List<Widget> _bodies = [
    //WebHome(),
    const About(), const Contact(), const Projects(), const More()
  ];
  Widget body = const About();
  int index = 0;
  void setIndex(int index) {
    this.index = index;
    body = _bodies[index];
    notifyListeners();
  }
}
