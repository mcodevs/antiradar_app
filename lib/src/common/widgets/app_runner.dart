import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

final class GetIcon {
  const GetIcon._();

  static late final BitmapDescriptor _icon;

  static BitmapDescriptor get icon => _icon;

  static Future<void> initialize() async {
    _icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/icons/camera.png",
      mipmaps: false,
    );
  }

}