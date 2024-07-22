import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/text_style_constant.dart';
import 'package:travel_app/core/helper/asset_helper.dart';
import 'package:travel_app/core/helper/image_helper.dart';
import 'package:travel_app/presentation/screens/main_app.dart';
import 'package:travel_app/presentation/widgets/button_widget.dart';

Widget _buildIntemIntroScreen(String image, String title, String description,
    AlignmentGeometry alignmentGeometry) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: alignmentGeometry,
        child: ImageHelper.loadFromAsset(image,
            height: 375, fit: BoxFit.fitHeight),
      ),
      const SizedBox(
        height: kMediumPadding * 2,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMediumPadding,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyles.defaultStyle.bold),
          const SizedBox(
            height: kMediumPadding,
          ),
          Text(description, style: TextStyles.defaultStyle)
        ]),
      )
    ],
  );
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const routerName = "intro_screen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page?.toInt() ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildIntemIntroScreen(
                AssetHelper.slide1,
                "Book a flight",
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight),
            _buildIntemIntroScreen(
                AssetHelper.slide2,
                "Find a hotel room",
                'Select the day, book your room. We give you the best price.',
                Alignment.center),
            _buildIntemIntroScreen(
                AssetHelper.slide3,
                "Enjoy your trip",
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft),
          ],
        ),
        Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding,
          child: Row(children: [
            Expanded(
              flex: 7,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding),
              ),
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: _pageStreamController.stream,
              builder: ((context, snapshot) {
                return Expanded(
                  flex: 3,
                  child: ButtonWidget(
                    title: snapshot.data != 2 ? "Next" : "Get Started",
                    onTap: () {
                      if ((_pageController.page?.toInt() ?? 0) != 2) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      } else {
                        Navigator.of(context).pushNamed(MainApp.routerName);
                      }
                    },
                  ),
                );
              }),
            )
          ]),
        )
      ],
    ));
  }
}

class IntroItem extends StatelessWidget {
  const IntroItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [ImageHelper.loadFromAsset(AssetHelper.slide1)]),
    );
  }
}
