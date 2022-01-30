import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelnepal/justdrive/Services/firestoreService.dart';
import 'package:travelnepal/justdrive/Models/appointment.dart';
import 'package:travelnepal/justdrive/Models/bill.dart';
import 'package:travelnepal/justdrive/services/apiPath.dart';

abstract class Database {
  Future<void> createAppointment(Appointment appointment);
  Stream<List<Appointment>> appointmentsStream();
  Stream<List<Bill>> billStream();
  Future<void> DeleteAppointment(Appointment appointment);
  Future<void> createBill(Bill bill);
  Future<void> DeleteBill(Bill bill);
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;
  @override
  Future<void> createAppointment(Appointment appointment) async =>
      await _service.setData(
        path: APIPath.appointment(uid, appointment.id),
        data: appointment.toMap(),
      );

  @override
  Future<void> createBill(Bill bill) async => await _service.setData(
        path: APIPath.bill(uid, bill.id),
        data: bill.toMap(),
      );

  @override
  Future<void> DeleteAppointment(Appointment appointment) async =>
      await _service.deleteData(path: APIPath.appointment(uid, appointment.id));

  @override
  Future<void> DeleteBill(Bill bill) async =>
      await _service.deleteData(path: APIPath.bill(uid, bill.id));

  Stream<List<Appointment>> appointmentsStream() => _service.collectionStream(
        path: APIPath.appointments(uid),
        builder: (data, documentId) => Appointment.fromMap(data, documentId),
      );

  Stream<List<Bill>> billStream() => _service.collectionStream(
        path: APIPath.bills(uid),
        builder: (data, documentId) => Bill.fromMap(data, documentId),
      );
}
