import 'package:antiradar/firebase_options.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final $storage;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  $storage = await SharedPreferences.getInstance();
  runApp(const App());
}
