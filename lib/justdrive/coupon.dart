import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_alert_dialog.dart';
import 'package:travelnepal/justdrive/Services/apiPath.dart';
import 'package:travelnepal/justdrive/Services/firestoreService.dart';
import 'package:travelnepal/justdrive/couponsAvailable.dart';
import 'package:travelnepal/justdrive/orderComplete.dart';

class Coupon extends StatefulWidget {
  final carcost;

  const Coupon({Key key, this.carcost}) : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  final myController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String coupon;
  int status = 0;

  @override
  void initState() {
    inputData();
    super.initState();
    print("init");
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  void inputData() async {
    // final FirebaseUser user = await auth.currentUser();
    // uid = user.uid;
    // print(uid);
    // here you write the codes to input the data into firestore
  }
  final _service = FirestoreService.instance;
  //TODO
  Stream<List<Appointment>> appointmentsStream() => _service.collectionStream(
        path: APIPath.appointments(uid),
        builder: (data, documentId) => Appointment.fromMap(data, documentId),
      );
  String textDis = 'Proceed without coupon';
  CouponVerify() async {
    final appointments = await appointmentsStream().first;
    final allNames =
        appointments.map((appointment) => appointment.name).toList();
    int count = allNames.length - 1;
    print(count);
    setState(() {});

    coupon = myController.text;
    print(coupon);
    if (coupon == 'FIRST' && count < 3) {
      status = 1;
      textDis = 'Proceed';
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied on your order.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'FIRST') {
      textDis = 'Proceed without coupon';
      return PlatformAlertDialog(
        title: 'Not Available!',
        content: 'Coupon only for first 3 orders.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'EXTRA10') {
      status = 1;
      textDis = 'Proceed';
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied for 20% off.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'REGULAR' && count > 10) {
      status = 1;
      textDis = 'Proceed';
      return PlatformAlertDialog(
        title: 'Congratulations!',
        content: 'Coupon Applied for your order.',
        defaultActionText: 'Okay',
      ).show(context);
    } else if (coupon == 'REGULAR') {
      textDis = 'Proceed without coupon';
      return PlatformAlertDialog(
        title: 'Not Available!',
        content: 'Coupon only for users with more than 10 orders.',
        defaultActionText: 'Okay',
      ).show(context);
    } else {
      print(coupon);
      textDis = 'Proceed without coupon';
      status = 0;
      return PlatformAlertDialog(
        title: 'Error!',
        content: 'Coupon not valid!',
        defaultActionText: 'Okay',
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Coupons",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              //autovalidate: true,
              key: formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                        labelText: "Name", border: OutlineInputBorder()),
                    onSaved: (value) => coupon = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: CouponVerify,
                    child: Text("Verify"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CouponsAvailable()));
                    },
                    child: Text("View Available Coupons"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Per day price:"),
                          //Text(widget.carcost)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderComplete()));
                    },
                    child: Text(textDis),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
