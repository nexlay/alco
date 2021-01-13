import 'package:alco/about/contact.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String versionName;
  String versionCode;
  ScrollController _controller;
  double _opacityLevel = 0.0;

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;
  }

  @override
  void initState() {
    _getAppVersion();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent - 250 &&
        !_controller.position.outOfRange) {
      setState(() {
        _opacityLevel = 1.0;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _opacityLevel = 0.0;
      });
    }
  }

  void _showAboutDialog() => showAboutDialog(
        context: context,
        applicationName: 'Alco',
        applicationVersion: versionName,
        applicationIcon: Image.asset(
          'image/alco_logo.jpg',
          height: 55.0,
          width: 55.0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScrollable(context),
    );
  }

  Widget _buildScrollable(BuildContext context) {
    return NestedScrollView(
      controller: _controller,
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
                'About',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Contact(),
                    ),
                  );
                },
                title: Text(
                  'Contact',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () => _showAboutDialog(),
                title: Text(
                  'Open source licenses',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
