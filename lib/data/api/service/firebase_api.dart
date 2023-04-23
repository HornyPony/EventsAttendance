import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_attendance/data/api/model/api_attendance.dart';
import 'package:events_attendance/data/api/model/api_event.dart';
import 'package:events_attendance/data/api/request/attend_event.dart';
import 'package:events_attendance/data/api/request/firebase_user.dart';
import 'package:events_attendance/data/mapper/event_mapper.dart';
import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/presentation/utils/map_keys.dart';

class FirebaseService {
  ///FirebaseFirestore
  Stream<List<EventItem>> readEvents({required String searchFieldText}) {
    print(searchFieldText);

    return FirebaseFirestore.instance
        .collection(MapKeys.events)
        .orderBy(MapKeys.startDate)
        .snapshots()
        .map(
          (eventSnapshot) => eventSnapshot.docs
              .map(
                (eventDoc) => EventMapper.fromApi(
                  ApiEvent.fromApi(
                    eventDoc.data(),
                  ),
                  eventDoc.id,
                ),
              )
              .toList(),
        );
  }

  Future<bool> getIsUserExists({required String login}) async {
    final doc = await FirebaseFirestore.instance
        .collection(MapKeys.users)
        .doc(login)
        .get();
    final bool isUserExists = doc.exists;

    print(isUserExists);
    return isUserExists;
  }

  Future<void> createUser({required FirebaseUserBody firebaseUserBody}) async {
    final docUser = FirebaseFirestore.instance
        .collection(MapKeys.users)
        .doc(firebaseUserBody.login);

    await docUser.set(firebaseUserBody.toApi());
  }

  Future<ApiAttendance> attendEvent({required AttendEventBody attendEventBody}) async {
    final doc = FirebaseFirestore.instance
        .collection(MapKeys.visitors)
        .doc('${attendEventBody.eventId} - ${attendEventBody.login}');


    await doc.set(attendEventBody.toApi());

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await doc.get();


    return ApiAttendance.fromApi(documentSnapshot.data() ?? {});
  }

  Future<ApiAttendance> updateAttendance({required AttendEventBody attendEventBody}) async {
    final doc = FirebaseFirestore.instance
        .collection(MapKeys.visitors)
        .doc('${attendEventBody.eventId} - ${attendEventBody.login}');

    await doc.update({
      MapKeys.checkEndDateTime: attendEventBody.checkEndDateTime,
    });

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await doc.get();


    return ApiAttendance.fromApi(documentSnapshot.data() ?? {});

  }

  Future<ApiAttendance> checkAttendance({
    required String login,
    required String eventId,
  }) async {
    final doc = await FirebaseFirestore.instance
        .collection(MapKeys.visitors)
        .doc('$eventId - $login')
        .get();

    return ApiAttendance.fromApi(doc.data() ?? {});
  }
  ///LocalMethods
}
