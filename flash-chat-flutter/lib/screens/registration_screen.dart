import 'package:flash_chat/components/InputTextFieldWidget.dart';
import 'package:flash_chat/components/LabeledButtonWidget.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/services/FirebaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Util.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email, password;
  bool showSpinner = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
              backgroundColor: Colors.yellow, color: Colors.red, fontSize: 30),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: kLogo,
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              InputTextFieldWidget(
                icon: Icons.email,
                hint: 'Enter your email',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              InputTextFieldWidget(
                icon: Icons.lock,
                hint: 'Enter your password',
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              LabeledButtonWidget(
                  label: 'Register',
                  labelColor: Colors.blueAccent,
                  onPress: () async {
                    if (email.validateEmail() && password.validatePassword()) {
                      setState(() {
                        showSpinner = true;
                      });

                      try {
                        var user = await FirebaseHelper.handleRegister(email, password);
                        if(user !=null){
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        print(e);
                        showInSnackBar(e.message);
                      }


                    } else {
                      showInSnackBar('Error Email and Password Not Valid');
                    }

                  })
            ],
          ),
        ),
      ),
    );
  }
}
