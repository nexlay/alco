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
  ScrollController _scrollController;
  double _opacityLevel = 0.0;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent - 250 &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _opacityLevel = 1.0;
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _opacityLevel = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show fact'),
        onPressed: () {
          setState(() {
            _selected = true;

            alcoholFacts.nextFact();
          });
        },
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            leading: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacityLevel,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: Colors.white10,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Facts',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ];
      },
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
