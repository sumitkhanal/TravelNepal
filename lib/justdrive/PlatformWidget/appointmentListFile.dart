import 'package:flutter/material.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile({Key key, @required this.appointment, this.onTap})
      : super(key: key);
  final Appointment appointment;
  final VoidCallback onTap;
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
            Text("Car Name: " + appointment.carname.toString()),
            SizedBox(
              height: 5,
            ),
            Text("Pickup date: " +
                appointment.pickdate.toDate().toString().substring(0, 11)),
            SizedBox(
              height: 5,
            ),
            Text("Drop off date: " +
                appointment.dropdate.toDate().toString().substring(0, 11)),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
