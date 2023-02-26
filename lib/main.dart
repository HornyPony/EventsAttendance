import 'package:events_attendance/data/service/firebase_api.dart';
import 'package:events_attendance/internal/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseApi.initFirebase();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Application(),
    ),
  );
}
