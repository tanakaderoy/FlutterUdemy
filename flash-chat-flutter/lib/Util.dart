import 'package:flutter/material.dart';

extension StringExtension on String{
  bool validateEmail() {
    if(this == null){
      return false;
    }
    if(this.isEmpty){
      return false;
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(this)) ? false : true;
  }

  bool validatePassword(){
    if(this == null){
      return false;
    }
    if(this.isEmpty){
      return false;
    }
    if(this.length < 6){
      return false;
    }
    return true;
  }

}

