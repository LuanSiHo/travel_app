import 'package:flutter/material.dart';
import 'package:travel_app/presentation/screens/intro_screen.dart';
import 'package:travel_app/presentation/screens/main_app.dart';
import 'package:travel_app/presentation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routerName: (context) => const SplashScreen(),
  IntroScreen.routerName: (context) => const IntroScreen(),
  MainApp.routerName:(context) => const MainApp()
};
