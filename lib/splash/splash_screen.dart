import 'package:alco/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlcoSplashScreen extends StatefulWidget {
  @override
  _AlcoSplashScreenState createState() => _AlcoSplashScreenState();
}

class _AlcoSplashScreenState extends State<AlcoSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blueAccent,
              Colors.blueAccent[700],
              Colors.blueAccent,
              Colors.blueAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildLogo(),
                    ),
                    Expanded(
                      flex: 3,
                      child: _buildText(),
                    ),
                    Expanded(
                      flex: 0,
                      child: _buildButtons(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 56.0, right: 56.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage('image/alco_logo.jpg'),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Alco',
            style: TextStyle(
              color: Colors.white,
              fontSize: 66.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'FredokaOne',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(left: 56.0, right: 56.0),
      child: RichText(
        softWrap: true,
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: 'Welcome! ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          children: [
            TextSpan(
                text: 'To calculate the amount of alcohol in blood, click '),
            TextSpan(
              text: '\'Next\'.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        RaisedButton(
          child: const Text(
            'Exit',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        RaisedButton(
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
