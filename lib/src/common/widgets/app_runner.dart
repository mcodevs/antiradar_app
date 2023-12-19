import 'package:antiradar/src/common/configurations/initialize.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';

abstract final class AppRunner {
  const AppRunner._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetIcon.initialize();
    await LocalDBService.initialize();
    // LocalDBService.storage.clear();
    const App().run();
  }
}

