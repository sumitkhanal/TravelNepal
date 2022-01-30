import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/SignIn/auth.dart';
import 'package:travelnepal/justdrive/info.dart';
// change to your home page locaation
//Change justmiles to travelnepal/justdrive

class CreateAccount extends StatefulWidget {
  final Function toggle;
  CreateAccount(this.toggle);
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isLoading = false;

  // AuthMethods authMethods = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      // authMethods
      //     .signUpwithEmailAndPassword(emailTEC.text, passwordTEC.text)
      //     .then((val) {
      //   print("$val");
      // });
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RentPage()
              //CHANGE HomePage() to your home page's name and also import that page.
              ));
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
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
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
                        key: formKey,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: userNameTEC,
                              validator: (val) {
                                return val.isEmpty || val.length < 6
                                    ? "Username must be greater than 5 characters!"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Username",
                                  focusColor: Color(0xFF18D191)),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)
                                    ? null
                                    : "Not a valid Email ID!";
                              },
                              controller: emailTEC,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "E-Mail",
                                  focusColor: Color(0xFF18D191)),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Password too short!";
                              },
                              controller: passwordTEC,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  focusColor: Color(0xFF18D191)),
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        signMeUp();
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
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginReg()));
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Already have an account?",
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
