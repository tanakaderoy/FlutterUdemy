import 'package:flutter/material.dart';

class LabeledButtonWidget extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Function onPress;

  LabeledButtonWidget(
      {@required this.label,
        @required this.labelColor,
        @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: labelColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPress(); //Go to login screen.
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
