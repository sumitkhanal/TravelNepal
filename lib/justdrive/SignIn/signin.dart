import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelnepal/justdrive/Models/customDrawer.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_alert_dialog.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_exception_alert_dialog.dart';
import 'package:travelnepal/justdrive/SignIn/auth.dart';

import '../info.dart';
// change to your home page locaation
//Change justmiles to justmiles_app

class LoginReg extends StatefulWidget {
  final Function toggle;
  LoginReg(this.toggle);

  @override
  _LoginRegState createState() => _LoginRegState();
}

class _LoginRegState extends State<LoginReg> {
  bool isLoading = false;

  // AuthMethods authMethods = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  logMeIn() async {
    try {
      if (true) {
        setState(() {
          isLoading = true;
        });
        print("BB");
        // await authMethods
        //     .signInWithEmailAndPassword(emailTEC.text, passwordTEC.text)
        //     .then((result) async {
        //   if (result != null) {
        //     Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(builder: (context) => RentPage()),
        //       (route) => false,
        //     );
        //   } else {
        //     setState(() {
        //       isLoading = false;
        //     });
        //     print("AAAAa");
        //   }
        // });
      }
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation Failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Just Miles"),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/logo.jpg",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: emailTEC,
                    decoration: InputDecoration(
                        labelText: "Email", focusColor: Color(0xFF18D191)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordTEC,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", focusColor: Color(0xFF18D191)),
                  ),
                ),
              ])),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  logMeIn();
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF18D191),
                  ),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                      child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.toggle();
                },
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                      child: Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
