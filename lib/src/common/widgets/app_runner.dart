import 'package:antiradar/src/common/configurations/initialize.dart';
import 'package:antiradar/src/common/data/services/flutter_tts_service.dart';
import 'package:antiradar/src/common/data/services/geofencing.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

abstract final class AppRunner {
  const AppRunner._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetIcon.initialize();
    await LocalDBService.initialize();
    await TTSService.initialize();
    Geofencing.initialize();
    await [
      Permission.location,
      Permission.activityRecognition,
    ].request();
    // LocalDBService.storage.clear();

    const App().run();
  }
}
