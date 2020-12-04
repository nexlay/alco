import 'package:alco/facts_about_alcohol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AlcoholFacts alcoholFacts = AlcoholFacts();

class Facts extends StatefulWidget {
  @override
  _FactsState createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show fact'),
        onPressed: () {
          setState(() {
            _selected = true;

            alcoholFacts.nextFact();
          });
        },
      ),
      body: Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 1),
          firstChild: Image(
            image: AssetImage('image/pablo.png'),
          ),
          secondChild: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              alcoholFacts.getFact(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          crossFadeState:
              _selected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }
}
