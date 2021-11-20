import 'package:flutter/material.dart';
import 'package:moods/constants/constants.dart';

abstract class BuyMeACoffeeThemeData {
  Color backgroundColor;
  Color textColor;
}

class BlueTheme implements BuyMeACoffeeThemeData {
  @override
  Color backgroundColor = Constants.kBlueColor;
  @override
  Color textColor = Colors.white;
}
