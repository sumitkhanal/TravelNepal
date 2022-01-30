import 'package:flutter/material.dart';
// import 'package:matrix_link/pages/flight.dart';

import '../flight.dart';

class BuddhaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Buddha Air",
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
                                "https://techlekh.com/wp-content/uploads/2018/02/boeing-buddha-air.jpg"))),
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
                    "Buddha Air Pvt. Ltd (Nepali: बुद्ध एयर) is an airline based in Jawalakhel, Lalitpur, Nepal, near Patan.[3][4] It operates domestic as well as international services within Nepal and India, serving mainly large towns and cities in Nepal. Currently, it operates 33 flight routes in around 15 destinations of Nepal and an international flight to Varanasi of India.[5] Its main base is Tribhuvan International Airport, Kathmandu.[6] It was the largest domestic carrier in terms of passengers carried in 2020. ",
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
