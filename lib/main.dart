import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/presentation/screens/splash_screen.dart';
import 'package:travel_app/routes.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travel App',
        theme: ThemeData(
            primaryColor: ColorPalette.primaryColor,
            scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
            backgroundColor: ColorPalette.backgroundScaffoldColor),
        routes: routes,
        home: const SplashScreen());
  }
}