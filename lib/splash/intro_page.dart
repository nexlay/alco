import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MyHomePage(),
      ),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('image/$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "Welcome to Alco",
            body: "Easiest way to know degree of alcohol intoxication.",
            image: _buildImage('alco_logo.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Minimum time needed",
            body:
                "Calculation based on weight and the amount of consumed alcohol.",
            image: _buildImage('clip.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Clean and fast UI",
            body:
                "App created with Material Design has simple UI and flawless animations.",
            image: _buildImage('clip_clean.png'),
            decoration: pageDecoration,
          ),
        ],
        onSkip: () => _onIntroEnd(context),
        onDone: () => _onIntroEnd(context),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text(
          'Skip',
          style: TextStyle(color: Colors.blueAccent),
        ),
        next: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.blueAccent,
        ),
        done: const Text(
          'Done',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(6.0, 6.0),
          color: Color(0xFFD6D6D6),
          activeSize: Size(8.0, 8.0),
          //activeColor: Color(0xFFBDBDBD),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
