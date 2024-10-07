import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guzogo_cloned/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      const Center(
        child: Text("Booking ...."),
      ),
      const Center(
        child: Text("Notifications ...."),
      ),
      const Center(
        child: Text("Settings ...."),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          // ignore: deprecated_member_use
          FontAwesomeIcons.search,
        ),
        title: ("Search"),
        activeColorPrimary: const Color.fromARGB(255, 1, 2, 56),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.luggage),
        title: ("Booking"),
        activeColorPrimary: const Color.fromARGB(255, 1, 2, 56),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          FontAwesomeIcons.bell,
          fill: 0.2,
        ),
        title: ("Notification"),
        activeColorPrimary: const Color.fromARGB(255, 1, 2, 56),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.gear),
        title: ("Settings"),
        activeColorPrimary: const Color.fromARGB(255, 1, 2, 56),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      stateManagement: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      isVisible: true,
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      decoration: const NavBarDecoration(
          border:
              Border(top: BorderSide(color: Color.fromRGBO(1, 2, 56, 0.1)))),
      navBarStyle: NavBarStyle.style8,
    );
  }
}
