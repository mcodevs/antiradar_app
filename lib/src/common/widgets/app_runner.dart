import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';

abstract final class AppRunner {
  const AppRunner._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalDBService.initialize();
    const App().run();
  }
}