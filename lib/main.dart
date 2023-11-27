import 'package:antiradar/firebase_options.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const App());
}