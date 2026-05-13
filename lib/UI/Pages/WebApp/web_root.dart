import 'package:flutter/material.dart';
import 'package:hasanm08/UI/Pages/WebApp/menu_button.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';

class WebRoot extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const WebRoot({
    super.key,
    required this.currentPath,
    required this.child,
  });

  int get selectedIndex => AppShellRoutes.indexForPath(currentPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///menu
            Container(
              decoration: const BoxDecoration(
                border: null,
                color: Colors.blue,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/coding.png'))),
                        ),
                      ),
                      MenuButton(
                        icon: Icons.person,
                        text: "About",
                        route: '/about',
                        isSelected: selectedIndex == 0,
                      ),
                      MenuButton(
                        icon: Icons.call,
                        text: "Contact",
                        route: '/contact-me',
                        isSelected: selectedIndex == 1,
                      ),
                      MenuButton(
                        icon: Icons.work,
                        text: "Projects",
                        route: '/projects',
                        isSelected: selectedIndex == 2,
                      ),
                      MenuButton(
                        icon: Icons.more_horiz,
                        text: "More",
                        route: '/more',
                        isSelected: selectedIndex == 3,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Made With:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Exo2",
                              color: Colors.white)),
                      FlutterLogo(
                        style: FlutterLogoStyle.horizontal,
                        textColor: Colors.white,
                        size: 70,
                      )
                    ],
                  )
                ],
              ),
            ),

            /// body
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: child,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeClipper extends CustomClipper {
  @override
  getClip(Size size) {
    return Path()..moveTo(size.width / 4, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
