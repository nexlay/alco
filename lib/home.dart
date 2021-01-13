import 'package:alco/screens/facts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alco/symptoms.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'about/about_alco.dart';
import 'model/user.dart';

enum Gender { male, female }

Symptoms symptoms = Symptoms();
User user = User();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender _gender = Gender.male;

  final _weightController = TextEditingController();
  final _weightOfAlcoholController = TextEditingController();
  final _alcoholController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _weightController.dispose();
    _weightOfAlcoholController.dispose();
    _alcoholController.dispose();
  }

  void _clear() {
    _weightController.clear();
    _weightOfAlcoholController.clear();
    _alcoholController.clear();

    symptoms.result = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text(
                'Clear',
                style: TextStyle(color: Colors.blueAccent, fontSize: 12.0),
              ),
              onPressed: () {
                setState(() {
                  _clear();
                });
              },
            ),
          ),
        ],
        backgroundColor: Colors.white10,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text(
                  'Alco',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'FredokaOne',
                  ),
                ),
              ),
              Divider(
                thickness: 0.7,
                color: Colors.grey,
              ),
              ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.blueAccent,
                    size: 26.0,
                  ),
                  title: Text(
                    'Alcohol facts',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Facts(),
                      ),
                    );
                  }),
              ListTile(
                  leading: Icon(
                    Icons.info_rounded,
                    color: Colors.blueAccent,
                    size: 26.0,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => About(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Show result',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            user.weight = double.parse(_weightController.text);
            user.weightOfAlcohol =
                double.parse(_weightOfAlcoholController.text);
            user.alcohol = double.parse(_alcoholController.text);
            user.gender = _gender.toString().split('.').last;

            symptoms.calculateDrunkenness(user);

            symptoms.getDrunkennessLevel();

            _showResult(context);
          });
        },
      ),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() => SingleChildScrollView(
        child: Column(
          children: [
            _buildUserInformation(),
            _buildGenderSelect(),
          ],
        ),
      );

  Widget _buildGenderSelect() => Column(
        children: [
          ListTile(
            leading: Text(
              'Gender',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          Image(
            image: AssetImage('image/pablo_order.png'),
          ),
          ListTile(
            title: const Text('male'),
            leading: Radio(
              onChanged: (value) {
                setState(
                  () {
                    _gender = value;
                  },
                );
              },
              groupValue: _gender,
              value: Gender.male,
            ),
          ),
          ListTile(
            title: const Text('female'),
            leading: Radio(
              onChanged: (value) {
                setState(
                  () {
                    _gender = value;
                  },
                );
              },
              groupValue: _gender,
              value: Gender.female,
            ),
          ),
        ],
      );

  Widget _buildUserInformation() => Column(
        children: [
          ListTile(
            leading: Text(
              'Information',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                ListTile(
                  title: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      labelText: 'Weight, kg',
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _weightOfAlcoholController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      labelText: 'The amount of consumed alcohol, ml',
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _alcoholController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      labelText: 'Alcohol, %',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  _showResult(context) {
    Alert(
        context: context,
        title: '',
        alertAnimation: FadeAlertAnimation,
        content: Column(
          children: [
            Text(
              'Concentration of alcohol is' +
                  ' ${symptoms.result.toStringAsFixed(2)}' +
                  '%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: ListTile(
                leading: symptoms.getIcon(),
                title: Text(
                  symptoms.getDrunkennessType(),
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  symptoms.getSymptoms(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
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

  Widget FadeAlertAnimation(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
