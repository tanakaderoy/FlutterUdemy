import 'package:bmi_calculator/utils/Constants.dart';
import 'package:flutter/material.dart';

class CalculateButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final Function onPress;


  CalculateButtonWidget(this.buttonLabel, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       onPress();
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonLabel,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}