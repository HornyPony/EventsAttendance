import 'package:cloud_firestore/cloud_firestore.dart';

class EventItem {
  final String id;
  final String name;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String address;
  final GeoPoint geoPoint;
  final String description;

  EventItem({
    required this.id,
    required this.name,
    required this.startDateTime,
    required this.endDateTime,
    required this.address,
    required this.geoPoint,
    required this.description,
  });


}
