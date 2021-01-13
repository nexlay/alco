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
      d: 'Sobriety or low-level intoxication',
      s: 'At this stage of intoxication, the person’s behavior will be normal with no visible signs of intoxication, such as slurred speech or delayed reaction time.',
      i: Icon(
        MyFlutterApp.emo_happy,
        color: Colors.green,
      ),
    ),
    Result(
      d: 'Euphoria',
      s: 'If a person has generally consumed two to three drinks as a man or one to two drinks as a woman in an hour, they’ll enter the euphoric stage of intoxication. Some symptoms include: an increase in chattiness and confidence, a delayed reaction time, decreased inhibitions',
      i: Icon(MyFlutterApp.emo_squint, color: Colors.green[700]),
    ),
    Result(
      d: 'Excitement',
      s: 'At this stage, a man might have consumed three to five drinks in an hour, or two to four drinks for a woman. At this time, a person will begin to experience emotional instability and a significant loss of coordination.Other symptoms include: a loss of judgment and memory, vision problems, loss of balance, drowsiness. A person will appear visibly “drunk” at this stage.',
      i: Icon(
        MyFlutterApp.emo_laugh,
        color: Colors.green[900],
      ),
    ),
    Result(
      d: 'Confusion',
      s: 'This stage of intoxication is marked by emotional outbursts and a major loss of coordination. The person may not be able to stand up, may stagger when walking, and will likely be extremely confused about what’s going on. People in this stage of intoxication are very likely to forget things happening around or to them. They might “black out” without actually losing consciousness and may not be able to feel pain. This makes them at risk of injury.',
      i: Icon(
        MyFlutterApp.emo_sleep,
        color: Colors.orange,
      ),
    ),
    Result(
      d: 'Stupor',
      s: 'At this stage, a person no longer responds to the things happening around or to them. A person won’t be able to stand or walk. They may completely pass out or lose control over their bodily functions, becoming incontinent or vomiting uncontrollably. They may also experience seizures or have blue-tinged or pale skin. Their breathing and gag reflexes will likely be impaired. This stage can be very dangerous and even fatal if a person chokes on their vomit or becomes critically injured.',
      i: Icon(
        MyFlutterApp.emo_displeased,
        color: Colors.deepOrange,
      ),
    ),
    Result(
      d: 'Coma',
      s: 'This stage is extremely dangerous. A person’s breathing and blood circulation will be extremely slowed. Their motor responses and gag reflexes are nonfunctional, and their body temperature drops. A person at this stage is at risk of death. Emergency medical attention is necessary at this point to avoid death and severe health problems.',
      i: Icon(
        MyFlutterApp.emo_unhappy,
        color: Colors.redAccent,
      ),
    ),
    Result(
      d: 'Death',
      s: 'It may seem like a person has to drink a lot to get to this stage. But if a person drinks very quickly, they can get to this stage before long.',
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
