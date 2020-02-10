import 'package:bmi_calculator/utils/Constants.dart';
import 'package:bmi_calculator/screens/InputPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconContent extends StatelessWidget {
  final Gender gender;

  IconContent({this.gender});

  @override
  Widget build(BuildContext context) {
    IconData iconData = gender == Gender.male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus;
    String genderText = gender == Gender.male ? 'MALE' : 'FEMALE';

    final sizedBoxHeight = 15.0;
    final iconSize = 80.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}