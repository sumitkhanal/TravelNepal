import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';

class EachOrder extends StatefulWidget {
  final Appointment appointment;

  const EachOrder({Key key, this.appointment}) : super(key: key);
  @override
  _EachOrderState createState() => _EachOrderState();
}

class _EachOrderState extends State<EachOrder> {
  int duration;
  int total;
  int discountedPrice;

  @override
  void initState() {
    inputData();
    super.initState();
    print("init");
    setState(() {});
  }

  String uid;
  void inputData() async {
    duration = widget.appointment.dropdate
        .toDate()
        .difference(widget.appointment.pickdate.toDate())
        .inDays;
    total = widget.appointment.carprice * duration;
    discountedPrice = (widget.appointment.carprice *
            widget.appointment.dropdate
                .toDate()
                .difference(widget.appointment.pickdate.toDate())
                .inDays -
        ((widget.appointment.discount) / 100).round());
    // here you write the codes to input the data into firestore
    setState(() {});
  }

  String abc(String carname) {
    switch (carname) {
      case 'BMWi8':
        return "assets/bmwcar_card.png";
        break;
      case 'Alto':
        return "assets/alto.png";
        break;
      case 'Audi':
        return "assets/audicar.webp";
        break;
      case 'Benz':
        return "assets/benzcar_card.png";
        break;
      case 'Eon':
        return "assets/eon.png";
        break;
      case 'Honda':
        return "assets/amaze.png";
        break;
      case 'Hyundai':
        return "assets/hundai.png";
        break;
      case 'i10':
        return "assets/i10.png";
        break;
      case 'Jaguar':
        return "assets/jaguarcar.png";
        break;
      case 'Liva':
        return "assets/etios.png";
        break;
      case 'Renault':
        return "assets/kwid.png";
        break;
      case 'Suzuki':
        return "assets/Swift1.png";
        break;
      case 'Tata':
        return "assets/nexon.png";
        break;
      case 'Toyota':
        return "assets/toyota.webp";
        break;
      case 'Vento':
        return "assets/volkswagen.png";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Bookings",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Image.asset(
              abc(widget.appointment.carname),
              fit: BoxFit.contain,
              height: 250,
              width: 250,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  " Booking Details:",
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Table(
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Car: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.carname,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Car Cost: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$" + widget.appointment.carprice.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Duration: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.dropdate
                              .toDate()
                              .difference(widget.appointment.pickdate.toDate())
                              .inDays
                              .toString() +
                          " days",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total price: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$" +
                          (widget.appointment.carprice *
                                  widget.appointment.dropdate
                                      .toDate()
                                      .difference(
                                          widget.appointment.pickdate.toDate())
                                      .inDays)
                              .toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Discount: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.discount.toString() + "%",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total price after discount:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$" +
                          (widget.appointment.carprice *
                                  widget.appointment.dropdate
                                      .toDate()
                                      .difference(
                                          widget.appointment.pickdate.toDate())
                                      .inDays *
                                  (1 - (widget.appointment.discount / 100)))
                              .round()
                              .toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pickup date: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.pickdate
                          .toDate()
                          .toString()
                          .substring(0, 11),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Drop off date: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.dropdate
                          .toDate()
                          .toString()
                          .substring(0, 11),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Mobile: ",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.appointment.phone,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
