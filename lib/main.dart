import 'package:events_attendance/domain/model/user.dart';
import 'package:events_attendance/domain/model/user_shared_preferences.dart';
import 'package:events_attendance/get_it.dart';
import 'package:events_attendance/internal/application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetItLocator();
  await dotenv.load(fileName: ".env");
  await UserSharedPreferences.init();
  await Firebase.initializeApp();
  await User.setUser();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, // Color for Android
      statusBarBrightness: Brightness.light //  IOS.
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Application(),
    ),
  );
}
