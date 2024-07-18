import 'package:flutter/material.dart';
import 'package:travel_app/core/helper/asset_helper.dart';
import 'package:travel_app/core/helper/image_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const routerName = "intro_screen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PageView(
      children: [

      ],
    ));
  }
}

class IntroItem extends StatelessWidget {
  const IntroItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ImageHelper.loadFromAsset(AssetHelper.slide1)
      ]),
    );
  }
}
