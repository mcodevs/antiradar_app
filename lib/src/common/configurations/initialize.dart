import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
