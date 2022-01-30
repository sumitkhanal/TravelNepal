import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bill{
  Bill({@required this.id, @required this.title, @required this.cost, @required this.date});
  final String id;
  final String title;
  final int cost;
  final Timestamp date;
  factory Bill.fromMap(Map<String, dynamic> data, String documentId){
    if(data == null){
      return null;
    }
    final String title = data['title'];
    final int cost = data['cost'];
    final Timestamp date = data['date'];
    return Bill(
      id: documentId,
      title: title,
      cost: cost,
      date: date,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title':title,
      'cost':cost,
      'date': date,
    };
  }
}