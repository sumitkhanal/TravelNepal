import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponsAvailable extends StatefulWidget {
  @override
  _CouponsAvailableState createState() => _CouponsAvailableState();
}

class _CouponsAvailableState extends State<CouponsAvailable> {
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
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Available Coupons:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("   FIRST"),
                  ),
                ),
              ),
              Text("20% off for first three orders!")
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 82,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" REGULAR"),
                  ),
                ),
              ),
              Text("20% off for customers with\nmore than ten orders!")
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" EXTRA10"),
                  ),
                ),
              ),
              Text("10% off on all cars!")
            ],
          )
        ],
      ),
    );
  }
}
