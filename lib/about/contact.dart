import 'package:alco/custom_icons/mfglabs_icons.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with TickerProviderStateMixin {
  AnimationController _controller;
  ScrollController _scrollController;
  Animation<double> _animation;
  double _opacityLevel = 0.0;

  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerListener);
    super.initState();
  }

  _scrollControllerListener() {
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

  _uriLauncher(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _animatedCard(context),
    );
  }

  Widget _animatedCard(BuildContext context) {
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
                'Contact',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ];
      },
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _listTileInformation(
                      Mfglabs.github_circled_alt,
                      'Github',
                      'github.com/nexlay',
                      'https://github.com/nexlay',
                      0,
                      true),
                  _listTileInformation(
                      Mfglabs.twitter,
                      'Twitter',
                      'twitter.com/Nexlay',
                      'https://twitter.com/Nexlay',
                      0,
                      true),
                  _listTileInformation(
                      Icons.mail,
                      'example@gmail.com',
                      'Email',
                      'mailto: mmmmm@gmail.com?subject=Write a subject you interested in, please&body=',
                      0,
                      true),
                  _listTileInformation(Icons.share, 'Share Alco', '',
                      'https://github.com/nexlay', 1, true),
                  const SizedBox(
                    height: 80.0,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('image/contact.png'),
                    ),
                    title: const Text(
                      'Mykola Pryhodskyi',
                    ),
                    subtitle: const Text(
                      'Flutter developer',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        _showDeveloperInformation(context);
                      },
                      child: const Text(
                        'Check',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTileInformation(IconData icon, String title, String subtitle,
      String url, int type, bool hide) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
        ),
      ),
      trailing: Visibility(
        visible: hide,
        child: TextButton(
          onPressed: () {
            if (type == 0) {
              _uriLauncher(url);
              return;
            } else if (type == 1) {
              Share.share('https://github.com/nexlay');
              return;
            }
          },
          child: Text(
            type == 0 ? 'Check' : 'Share',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }

  _showDeveloperInformation(context) {
    Alert(
        context: context,
        title: 'Mykola Pryhodskyi',
        image: const CircleAvatar(
          backgroundImage: AssetImage('image/contact.png'),
          radius: 40,
        ),
        alertAnimation: fadeAlertAnimation,
        content: Column(
          children: [
            _listTileInformation(
                Icons.location_on,
                'Poland',
                'Location',
                'https://www.google.com/maps/search/?api=1&query=Bolesławiec',
                0,
                true),
            _listTileInformation(
                Icons.show_chart, 'Beginner', 'Level', '', 0, false),
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        buttons: []).show();
  }

  Widget fadeAlertAnimation(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
