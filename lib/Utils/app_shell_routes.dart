/// Paths and index mapping shared by [WebRoot] and mobile bottom navigation.
class AppShellRoutes {
  AppShellRoutes._();

  static const List<String> paths = [
    '/about',
    '/contact-me',
    '/projects',
    '/more',
  ];

  static int indexForPath(String path) {
    final i = paths.indexOf(path);
    return i >= 0 ? i : 0;
  }

  static String pathForIndex(int index) {
    if (index < 0 || index >= paths.length) {
      return paths.first;
    }
    return paths[index];
  }
}
