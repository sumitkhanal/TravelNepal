import 'package:travelnepal/botting.dart';
import 'package:travelnepal/flight_detail/flight_homenew.dart';
import 'package:travelnepal/justdrive/cardrive.dart';
import 'package:travelnepal/justdrive/info.dart';
import 'package:travelnepal/screens/blog.dart';
import 'package:travelnepal/screens/homepage.dart';
import 'package:travelnepal/screens/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flight.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: HomePage()),
    Center(child: MapApp()),
    Center(child: Chatapp()),
    Center(child: Blog()),
    Center(child: RentPage()),
    Center(
      child: FlightHomePage(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.orange,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_sharp, color: Colors.cyan),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_sharp, color: Colors.cyan),
            label: 'map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android, color: Colors.cyan),
            label: 'Bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.cyan),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi, color: Colors.cyan),
            label: 'Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight, color: Colors.cyan),
            label: 'Flights',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
