import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hasanm08/Utils/app_shell_routes.dart';

/// Mobile/tablet shell: same route-driven tabs as [WebRoot], with a bottom bar.
class MobilePage extends StatelessWidget {
  const MobilePage({
    Key? key,
    required this.currentPath,
    required this.child,
  }) : super(key: key);

  final String currentPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = AppShellRoutes.indexForPath(currentPath);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          final path = AppShellRoutes.pathForIndex(index);
          if (path != currentPath) {
            context.go(path);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
