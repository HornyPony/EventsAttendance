import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_attendance/data/api/model/api_attendance.dart';
import 'package:events_attendance/data/api/model/api_device.dart';
import 'package:events_attendance/data/api/model/api_event.dart';
import 'package:events_attendance/data/api/request/attend_event.dart';
import 'package:events_attendance/data/api/request/firebase_user.dart';
import 'package:events_attendance/data/mapper/event_mapper.dart';
import 'package:events_attendance/domain/model/device.dart';
import 'package:events_attendance/domain/model/event_item.dart';
import 'package:events_attendance/presentation/utils/map_keys.dart';

class FirebaseService {
  ///FirebaseFirestore
  Stream<List<EventItem>> readEvents({required String searchFieldText}) {



    return FirebaseFirestore.instance
        .collection(MapKeys.events)
        .where('name',
        isGreaterThanOrEqualTo: searchFieldText,
        isLessThanOrEqualTo: "$searchFieldText\uf7ff")
        .orderBy('name')
        .snapshots()
        .map(
          (eventSnapshot) {
            return eventSnapshot.docs
                .map(
                  (eventDoc) {
                    print(eventDoc.id);
                    return EventMapper.fromApi(
                      ApiEvent.fromApi(
                        eventDoc.data(),
                      ),
                      eventDoc.id,
                    );
                  }
            )
                .toList()..sort((a, b) => b.startDateTime.compareTo(a.startDateTime));
          }
        );
  }

  ///User
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

  Future<ApiDevice> getUserDeviceInfo({required String login}) async {
    final doc = await FirebaseFirestore.instance
        .collection(MapKeys.users)
        .doc(login)
        .get();

    return ApiDevice.fromApi(doc.data() ?? {});
  }

  Future<ApiDevice> updateDevice(
      {required FirebaseUserBody firebaseUserBody}) async {
    final doc = FirebaseFirestore.instance
        .collection(MapKeys.users)
        .doc(firebaseUserBody.login);

    await doc.update(firebaseUserBody.toApi());

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await doc.get();

    return ApiDevice.fromApi(documentSnapshot.data() ?? {});
  }

  ///Events
  Future<ApiAttendance> attendEvent(
      {required AttendEventBody attendEventBody}) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '${MapKeys.events}/${attendEventBody.eventId}/${MapKeys.visitors}')
        .doc(attendEventBody.login);

    await doc.set(attendEventBody.toApi());

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await doc.get();

    return ApiAttendance.fromApi(documentSnapshot.data() ?? {});
  }

  Future<ApiAttendance> updateAttendance(
      {required AttendEventBody attendEventBody}) async {
    final doc = FirebaseFirestore.instance
        .collection(
            '${MapKeys.events}/${attendEventBody.eventId}/${MapKeys.visitors}')
        .doc(attendEventBody.login);

    await doc.update({
      MapKeys.checkEndDateTime: attendEventBody.checkEndDateTime,
    });

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await doc.get();

    return ApiAttendance.fromApi(documentSnapshot.data() ?? {});
  }

  Future<ApiAttendance> checkAttendance({
    required String login,
    required String eventId,
  }) async {
    final doc = await FirebaseFirestore.instance
        .collection('${MapKeys.events}/$eventId/${MapKeys.visitors}')
        .doc(login)
        .get();

    return ApiAttendance.fromApi(doc.data() ?? {});
  }

  ///LocalMethods
}
