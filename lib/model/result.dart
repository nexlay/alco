import 'package:flutter/material.dart';

class Result {
  String drunkenness;
  String symptoms;
  Icon icon;

  Result({String d, String s, Icon i}) {
    drunkenness = d;
    symptoms = s;
    icon = i;
  }
}
