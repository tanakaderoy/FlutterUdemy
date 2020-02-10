import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  ReusableCard(this.color, {this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      ),
      onTap: () {
        onPress();
      },
    );
  }
}