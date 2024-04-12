import 'package:flutter/material.dart' hide Notification;
import 'package:hasanm08/Models/city.dart';
import 'package:hasanm08/UI/Components/deals_component.dart';
import 'package:hasanm08/UI/Pages/Example/home_screen.dart';
import 'package:hasanm08/UI/Pages/Example/notifications.dart';
import 'package:hasanm08/UI/Pages/Example/wish_list_page.dart';

mixin ExampleUtils {
  static int selectedLocation = 0;
  static int selectedIndex = 0;
  static List<String> locations = ['Kerman (KER)', 'Mashhad (MASH)'];

  static bool shrinkHeader = false;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.longestSide;
  static Color discountBackground(BuildContext context) =>
      Theme.of(context).primaryColor;
  static Color flightColor(BuildContext context) =>
      Theme.of(context).primaryColor;
  static Color chipBackground(BuildContext context) =>
      Theme.of(context).secondaryHeaderColor.withOpacity(.2);
  static Color borderColor(BuildContext context) =>
      Theme.of(context).primaryColor.withAlpha(100);
  static List<Widget> bodies = [
    const HomeScreen(),
    const WishList(),
    const DealsComponent(),
    const Notification()
  ];

  static List<City> cities = [
    const City(
      image: "assets/images/Kerman.png",
      name: "Kerman",
      monthYear: "Far 1399",
      price: "258500",
      offPrice: "150000",
      discount: "58",
    ),
    const City(
      image: "assets/images/Mashhad.png",
      name: "Mashhad",
      monthYear: "Far 1399",
      price: "258500",
      offPrice: "150000",
      discount: "58",
    ),
    const City(
      image: "assets/images/Tehran.png",
      name: "Tehran",
      monthYear: "Far 1399",
      price: "258500",
      offPrice: "150000",
      discount: "58",
    ),
  ];
  static List<BottomNavigationBarItem> navigationBarItem(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: color,
        ),
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Explore"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: color,
        ),
        icon: const Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: "WishList"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
          color: color,
        ),
        icon: const Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        label: "Deals"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: color,
        ),
        icon: const Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        label: "Notifications"));
    return items;
  }
}
