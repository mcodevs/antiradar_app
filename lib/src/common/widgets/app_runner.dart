import 'package:antiradar/src/common/configurations/initialize.dart';
import 'package:antiradar/src/common/data/services/flutter_tts_service.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class AppRunner {
  const AppRunner._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetIcon.initialize();
    await LocalDBService.initialize();
    final tts = await TTSService.initialize();
    // LocalDBService.storage.clear();

    runApp(
      RepositoryProvider<TTSService>.value(
        value: tts,
        child: const App(),
      ),
    );
  }
}
