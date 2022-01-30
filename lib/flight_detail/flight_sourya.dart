import 'package:flutter/material.dart';
// import 'package:travelnepal/Futtur_flight_booking_UI-main/flight.dart';

import '../flight.dart';
// import 'package:matrix_link/pages/flight.dart';

class SoryaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Sourya Air",
            style: TextStyle(
              color: Colors.blue.shade100,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 10,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://ktmguide.com/wp-content/uploads/2019/12/20160812_140317-1024x557.jpg"))),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Price: Rs. 6000",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Saurya Airlines Pvt. Ltd (Nepali: सौर्य एयरलाईन्स) is an airline based in Kathmandu, Nepal. As of August 2017, the airline serves five destinations across three provinces of Nepal from its hub at Tribhuvan International Airport. Saurya Airlines operates a fleet of CRJ 200 aircraft. Saurya Airlines was the first airline to introduce Canadair Regional Jet in Nepal, also becoming the second airline in Nepal after Cosmic Air to operate a jet engine aircraft on the domestic routes.  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BookFlight()));
                  },
                  child: Text("BOOK NOW"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
