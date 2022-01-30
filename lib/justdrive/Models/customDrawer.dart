import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/Services/apiPath.dart';
import 'package:travelnepal/justdrive/Services/firestoreService.dart';

import 'package:travelnepal/justdrive/SignIn/auth.dart';
import 'package:travelnepal/justdrive/SignIn/authenticate.dart';
import 'package:travelnepal/justdrive/SignIn/signin.dart';
import 'package:travelnepal/justdrive/cardrive.dart';
import 'package:travelnepal/justdrive/info.dart';
import 'package:travelnepal/justdrive/orderhistory.dart';
import 'package:travelnepal/screens/homepage.dart';
import 'package:travelnepal/screens/homescreen.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key, @required this.currentTab}) : super(key: key);

  String currentTab;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    // user = await _auth.currentUser();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                color:
                    widget.currentTab == 'Renting' ? Colors.cyan : Colors.cyan),
            child: new ListTile(
              leading: Icon(Icons.home),
              title: new Text('HOME'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: new BoxDecoration(
                color: widget.currentTab == 'Renting'
                    ? Colors.lightBlueAccent
                    : Colors.lightBlueAccent),
            child: new ListTile(
              title: new Text(' Car Renting '),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RentPage()));
              },
            ),
          ),
          new Divider(
            color: Colors.white,
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: widget.currentTab == 'History'
                    ? Colors.lightBlueAccent
                    : Colors.lightBlueAccent),
            child: new ListTile(
              title: new Text(' Bookings History '),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OrderHistory()));
              },
            ),
          ),
          new Divider(
            color: Colors.blueAccent,
            height: 5.0,
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
