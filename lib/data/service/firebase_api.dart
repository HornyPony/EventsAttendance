import 'package:firebase_core/firebase_core.dart';

class FirebaseApi {
  ///FirebaseCore
  static Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }
}
