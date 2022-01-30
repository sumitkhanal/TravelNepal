import 'package:flutter/material.dart';
// import 'package:travelnepal/Futtur_flight_booking_UI-main/flight.dart';

import '../flight.dart';
// import 'package:matrix_link/pages/flight.dart';

class SimrikDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Simrik Air",
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
                                "https://hotelfornepal.com/wp-content/uploads/2016/10/IMG_3991-1.jpg"))),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Price: Rs. 5000",
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
                    " Simrik Airlines Pvt. Ltd. was an airline based in Kathmandu, Nepal operating domestic scheduled flights from its base at Tribhuvan International Airport. It was the partner company of Simrik Air, a Nepalese helicopter airline currently operating four helicopters. ",
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
