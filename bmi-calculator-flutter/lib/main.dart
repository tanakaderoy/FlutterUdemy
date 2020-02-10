import 'package:bmi_calculator/utils/MyTheme.dart';
import 'package:bmi_calculator/screens/InputPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: MyTheme.primaryColor,
        scaffoldBackgroundColor: MyTheme.primaryColor,
      ),
    );
  }
}




