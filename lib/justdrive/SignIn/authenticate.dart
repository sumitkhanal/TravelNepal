import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/SignIn/createAccount.dart';
import 'package:travelnepal/justdrive/SignIn/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginReg(toggleView);
    } else {
      return CreateAccount(toggleView);
    }
  }
}
