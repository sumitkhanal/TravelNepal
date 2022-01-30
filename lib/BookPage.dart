import 'package:flutter/material.dart';

import 'flight.dart';

// import 'Futtur_flight_booking_UI-main/flight.dart';
// import 'package:matrix_link/models/hotel_model.dart';
// import 'package:matrix_link/pages/flight.dart';
// import 'package:matrix_link/hotels.dart';

// class BookPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Container(
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/undraw_Booking.png"),
//                 fit: BoxFit.cover)),
//         child: Row(
//           children: [
//             SizedBox(
//               height: 10,
//               width: 20,
//             ),
//             ClipOval(
//               child: Material(
//                 color: Colors.green,
//                 child: InkWell(
//                   splashColor: Colors.red,
//                   child: SizedBox(
//                     width: 70,
//                     height: 70,
//                     child: Icon(
//                       Icons.flight,
//                       size: 40,
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => DropDown()));
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(width: 50),
//             ClipOval(
//               child: Material(
//                 color: Colors.green,
//                 child: InkWell(
//                   splashColor: Colors.red,
//                   child: SizedBox(
//                     width: 70,
//                     height: 70,
//                     child: Icon(
//                       Icons.hotel_rounded,
//                       size: 40,
//                     ),
//                   ),
//                   onTap: () {},
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '  Travel - Nepal',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            automaticallyImplyLeading: false,
            elevation: 0.0,
            titleSpacing: 0,
            bottom: TabBar(
              tabs: [
                Tab(child: Icon(Icons.flight)),
                Tab(child: Icon(Icons.hotel_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: BookFlight(),
              ),
              Center(
                child: Text("COnnect Hotel Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
