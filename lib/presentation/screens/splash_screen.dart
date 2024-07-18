import 'package:flutter/material.dart';
import 'package:travel_app/core/helper/asset_helper.dart';
import 'package:travel_app/core/helper/image_helper.dart';
import 'package:travel_app/presentation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routerName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    redirectToIntro();
  }

  void redirectToIntro() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamed(IntroScreen.routerName);

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ImageHelper.loadFromAsset(AssetHelper.backgroundSplash, fit: BoxFit.fitWidth)),
        Positioned.fill(child: ImageHelper.loadFromAsset(AssetHelper.circleSplash))
      ],
    );
  }
}