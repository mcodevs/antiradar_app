import 'package:antiradar/src/common/data/models/radars/speed_radar.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RadarServices extends ValueNotifier<List<SpeedRadar>> {
  RadarServices({List<SpeedRadar>? radars}) : super(radars ?? []);

  List<Geofence> toGeofence() => value.map((e) => e.toGeofence()).toList();

  Future<SpeedRadar> addRadar(
      String type, int speed, LatLng position, String direction) async {
    SpeedRadar radarModel = SpeedRadar(
        type: type, direction: direction, speed: speed, position: position);
    value.add(radarModel);
    await LocalDBService.saveRadars(value);
    notifyListeners();
    return radarModel;
  }

  void readRadars() {
    value = LocalDBService.readRadars();
    notifyListeners();
  }
}
