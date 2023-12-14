import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences $storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  $storage = await SharedPreferences.getInstance();
  runApp(const App());
}
