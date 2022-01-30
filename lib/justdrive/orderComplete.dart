import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/datetime.dart';
import 'package:travelnepal/justdrive/info.dart';
import 'package:travelnepal/justdrive/orderhistory.dart';
import 'package:travelnepal/justdrive/payment.dart';

class OrderComplete extends StatefulWidget {
  final String carname;
  final int carcost;

  const OrderComplete({Key key, this.carname, this.carcost}) : super(key: key);

  @override
  _OrderCompleteState createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  String carname1 = "A";
  @override
  void initState() {
    super.initState();
    setState(() {});
    print("init");
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
        backgroundColor: Colors.cyan,
        title: Text(
          "Travel Nepal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Booking Confirmed ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/tickmark.gif",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            Hero(
              tag: "ABC",
              child: Container(
                width: double.infinity,
                height: 150,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.carname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Price : \$${widget.carcost} per day",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Image.asset(
                            abc(widget.carname),
                            fit: BoxFit.contain,
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " View Details In Bookings Section",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              child: Text('Booking Section',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OrderHistory(),
                  ),
                  (route) => false,
                );
              },
            ),
            ElevatedButton(
              child: Text('Pay now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
