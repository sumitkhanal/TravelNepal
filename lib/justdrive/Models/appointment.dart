import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointment{
  Appointment(
    {
      @required this.id, @required this.name, @required this.phone, @required this.address,
      @required this.pincode, @required this.city, @required this.state, @required this.pickdate, @required this.dropdate,
      @required this.carname, @required this.carprice, @required this.discount,
    }
  );
  final String id;
  final String name;
  final String phone;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final Timestamp pickdate;
  final Timestamp dropdate;
  final String carname;
  final int carprice;
  final int discount;

  factory Appointment.fromMap(Map<String, dynamic> data, String documentId){
    if(data == null){
      return null;
    }
    final String name = data['name'];
    final String phone = data['phone'];
    final String address = data['address'];
    final String pincode = data['pincode'];
    final String city = data['city'];
    final String state = data['state'];
    final String carname = data['carname'];
    final int carprice = data['carprice'];
    final int discount = data['discount'];
    final Timestamp pickdate = data['pickdate'];
    final Timestamp dropdate = data['dropdate'];
    return Appointment(
      id: documentId,
      name: name,
      phone:phone,
      address:address,
      pincode:pincode,
      city:city,
      state:state,
      pickdate:pickdate,
      dropdate:dropdate,
        carname:carname,
        carprice:carprice,
        discount:discount
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name':name,
      'phone':phone,
      'address':address,
      'pincode':pincode,
      'city':city,
      'state':state,
      'pickdate':pickdate,
      'dropdate':dropdate,
      'carname':carname,
      'carprice':carprice,
      'discount':discount
    };
  }
}