import 'file:///D:/flutter_projects/alco/alco/lib/splash/splash_screen.dart';
import 'package:alco/splash/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AlcoApp());
}

class AlcoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}
