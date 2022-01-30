import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/ServicesModel.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';

class ServiceListTile extends StatelessWidget {
  const ServiceListTile({
    Key key,
    @required this.service,
  }) : super(key: key);
  final ServicesModel service;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text("Service Type: " + service.type.toString()),
            SizedBox(
              height: 5,
            ),
            Text("Car name: " + service.name.toString()),
            SizedBox(
              height: 5,
            ),
            Text("Pickup date: " +
                service.pickup.toDate().toString().substring(0, 11)),
            SizedBox(
              height: 5,
            ),
            Text(service.services != ""
                ? "Services: ${service.services}"
                : "No special services."),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Icon(Icons.settings),
      ),
    );
  }
}
