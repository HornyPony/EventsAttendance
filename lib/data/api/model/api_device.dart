import 'package:cloud_firestore/cloud_firestore.dart';

class ApiEvent {
  late final String name;
  late final DateTime startDate;
  late final DateTime endDate;
  late final String address;
  late final GeoPoint geoPoint;
  late final String description;

  ApiEvent.fromApi(Map<String, dynamic> map) {
    name = map['name'];
    startDate = map['startDate'].toDate();
    endDate = map['endDate'].toDate();
    address = map['address'];
    geoPoint = map['geoPoint'];
    description = map['description'];
  }
}
