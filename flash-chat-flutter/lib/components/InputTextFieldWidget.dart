import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String hint;
  final IconData icon;
//TODO Add ability to go to next text field
  InputTextFieldWidget(
      {@required this.hint, @required this.onChanged, @required this.icon});

  @override
  Widget build(BuildContext context) {

    return TextField(
      keyboardType: hint.contains('email') ? TextInputType.emailAddress: TextInputType.text,
      obscureText: hint.contains('password'),
      onChanged: (value) {
        //Do something with the user input.
        onChanged(value);
      },
      style: TextStyle(color: Colors.blueGrey),
      decoration: kInputDecoration.copyWith(
        hintText: hint,
        icon: Icon(
          icon,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
