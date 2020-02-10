
import 'package:bmi_calculator/utils/Constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 6.0,
      onPressed: () {
        onPress();
      },
      fillColor: kRoundButtonColor,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}