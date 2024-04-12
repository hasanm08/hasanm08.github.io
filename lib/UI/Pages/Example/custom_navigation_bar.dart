import 'package:flutter/material.dart';
import 'package:hasanm08/Utils/example_utils.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExampleUtils.bodies.elementAt(ExampleUtils.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: ExampleUtils.navigationBarItem(context),
          unselectedItemColor: Colors.black,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: ExampleUtils.selectedIndex,
          elevation: 1.5,
          onTap: (int index) {
            if (index != ExampleUtils.selectedIndex) {
              setState(() {
                ExampleUtils.selectedIndex = index;
              });
            }
          },
        ));
  }
}
