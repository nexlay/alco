import 'package:alco/model/result.dart';
import 'package:flutter/material.dart';
import 'custom_icons/my_flutter_app_icons.dart';
import 'model/user.dart';

class Symptoms {
  double _bodyFluid;
  double _ethanolDensity = 0.79;
  double result = 0.0;
  int _drunkennessLevel = 0;
  List<Result> _resultBank = [
    Result(
      d: 'Alcohol is absent',
      s: 'Natural blood alcohol level, no effects observed.',
      i: Icon(
        MyFlutterApp.emo_happy,
        color: Colors.green,
      ),
    ),
    Result(
      d: 'Slight intoxication',
      s: 'Alcohol has little effect.',
      i: Icon(MyFlutterApp.emo_squint, color: Colors.green[700]),
    ),
    Result(
      d: 'Mild intoxication',
      s: 'Mood improves, communication becomes easier, facial expressions become more expressive, and movements are less precise.',
      i: Icon(
        MyFlutterApp.emo_laugh,
        color: Colors.green[900],
      ),
    ),
    Result(
      d: 'Intoxication of moderate severity',
      s: 'Instead of a good mood, irritability, resentment, aggression may appear. Movement coordination is impaired, speech becomes slurred.',
      i: Icon(
        MyFlutterApp.emo_sleep,
        color: Colors.orange,
      ),
    ),
    Result(
      d: 'Intoxication',
      s: 'Symptoms of a loss of consciousness appear, which can lead to coma. Epileptic seizures sometimes occur.',
      i: Icon(
        MyFlutterApp.emo_displeased,
        color: Colors.deepOrange,
      ),
    ),
    Result(
      d: 'Severe intoxication',
      s: 'Alcohol poisoning, which can be fatal.',
      i: Icon(
        MyFlutterApp.emo_unhappy,
        color: Colors.redAccent,
      ),
    ),
    Result(
      d: 'Deadly poisoning',
      s: 'Fatal outcome.',
      i: Icon(MyFlutterApp.emo_cry, color: Colors.red),
    ),
  ];

  double calculateDrunkenness(User user) {
    if (user.gender == 'female') {
      _bodyFluid = 0.6;
    } else
      _bodyFluid = 0.7;

    double water = user.weight * _bodyFluid;

    double alcoholPart =
        (user.weightOfAlcohol * user.alcohol / 100) * _ethanolDensity;

    double delta = alcoholPart - (alcoholPart * 0.01);

    return result = delta / water;
  }

  int _calculateDrunkennessLevel(double result) {
    if (result <= 0.3) {
      return 0;
    } else if (result > 0.3 && result <= 0.5) {
      return 1;
    } else if (result > 0.5 && result <= 1.5) {
      return 2;
    } else if (result > 1.5 && result <= 2.0) {
      return 3;
    } else if (result > 2.0 && result <= 3.0) {
      return 4;
    } else if (result > 3.0 && result <= 5.0) {
      return 5;
    } else {
      return 6;
    }
  }

  void getDrunkennessLevel() {
    _drunkennessLevel = _calculateDrunkennessLevel(result);
  }

  // Creating getter methods for all data in _resultBank List
  String getDrunkennessType() {
    return _resultBank[_drunkennessLevel].drunkenness;
  }

  String getSymptoms() {
    return _resultBank[_drunkennessLevel].symptoms;
  }

  Icon getIcon() {
    return _resultBank[_drunkennessLevel].icon;
  }
}
