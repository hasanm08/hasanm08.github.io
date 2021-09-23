import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hasanm08/UI/Pages/WebApp/about.dart';
import 'package:hasanm08/UI/Pages/WebApp/contact.dart';
import 'package:hasanm08/UI/Pages/WebApp/more.dart';
import 'package:hasanm08/UI/Pages/WebApp/projects.dart';

class MenuBloc with ChangeNotifier {
  List<Widget> _bodies = [
    //WebHome(),
    About(), Contact(), Projects(), More()
  ];
  Widget body = About();
  int index = 0;
  void setIndex(int index) {
    this.index = index;
    body = _bodies[index];
    notifyListeners();
  }
}
