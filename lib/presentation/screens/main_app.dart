import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/presentation/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  static const routerName = "main_app";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            const HomeScreen(),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(
              horizontal: kMediumPadding, vertical: kDefaultPadding),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(FontAwesomeIcons.house),
                title: const Text("Home")),
            SalomonBottomBarItem(
                icon: const Icon(FontAwesomeIcons.solidHeart),
                title: const Text("Likes")),
            SalomonBottomBarItem(
                icon: const Icon(FontAwesomeIcons.briefcase),
                title: const Text("Booking")),
            SalomonBottomBarItem(
                icon: const Icon(FontAwesomeIcons.solidUser),
                title: const Text("Profile"))
          ],
        ));
  }
}
