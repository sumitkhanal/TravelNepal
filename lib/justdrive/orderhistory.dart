import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/PlatformWidget/appointmentListFile.dart';
import 'package:travelnepal/justdrive/PlatformWidget/list_items_builder.dart';
import 'package:travelnepal/justdrive/PlatformWidget/platform_exception_alert_dialog.dart';
import 'package:travelnepal/justdrive/Services/database.dart';
import 'package:travelnepal/justdrive/Services/firestoreService.dart';
import 'package:travelnepal/justdrive/eachOrder.dart';

import 'Models/customDrawer.dart';
import 'Services/apiPath.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    inputData();
    super.initState();
    print("init");
    setState(() {});
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid;
  void inputData() async {
    // final FirebaseUser user = await auth.currentUser();
    // uid = user.uid;
    // print(uid);
    setState(() {});
    // here you write the codes to input the data into firestore
  }

  final _service = FirestoreService.instance;
  //TODO
  Stream<List<Appointment>> appointmentsStream() => _service.collectionStream(
        path: APIPath.appointments(uid),
        builder: (data, documentId) => Appointment.fromMap(data, documentId),
      );
  //TODO
  @override
  Future<void> DeleteAppointment(Appointment appointment) async =>
      await _service.deleteData(path: APIPath.appointment(uid, appointment.id));

  Future<void> _delete(BuildContext context, Appointment appointment) async {
    try {
      await DeleteAppointment(appointment);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: 'Operation Failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        centerTitle: true,
        title: Text("Booking History",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      drawer: CustomDrawer(
        currentTab: 'History',
      ),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    return StreamBuilder<List<Appointment>>(
      stream: appointmentsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Appointment>(
            snapshot: snapshot,
            itemBuilder: (context, appointment) => Dismissible(
                key: Key('appointment-${appointment.id}'),
                background: Container(
                  color: Colors.red,
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => _delete(context, appointment),
                child: AppointmentListTile(
                  appointment: appointment,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EachOrder(
                                  appointment: appointment,
                                )));
                  },
                )));
      },
    );
  }
}
