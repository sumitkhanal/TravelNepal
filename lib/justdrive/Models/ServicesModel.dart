import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicesModel{
  ServicesModel(
      {
        @required this.id, @required this.name, @required this.pickup, @required this.address,@required this.services,@required this.type,
      }
      );
  final String id;
  final String type;
  final String name;
  final String address;
  final String services;
  final Timestamp pickup;

  factory ServicesModel.fromMap(Map<String, dynamic> data, String documentId){
    if(data == null){
      return null;
    }
    final String name = data['name'];
    final String type = data['type'];
    final String address = data['address'];
    final String services = data['services'];
    final Timestamp pickup = data['pickup'];
    return ServicesModel(
        id: documentId,
        name: name,
        address:address,
      pickup:pickup,
        services:services,
        type:type
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name':name,
      'address':address,
      'pickup':pickup,
      'services':services,
      'type':type
    };
  }
}