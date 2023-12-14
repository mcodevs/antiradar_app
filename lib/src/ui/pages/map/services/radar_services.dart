import 'dart:convert';

import 'package:antiradar/main.dart';
import 'package:antiradar/src/common/data/models/radars/speed_radar.dart';
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
    await $storage.setString(
      "radars",
      jsonEncode(value
          .map(
            (e) => e.toMap(),
          )
          .toList()),
    );
    notifyListeners();
    return radarModel;
  }

  void readRadars() {
    // $storage.clear();
    final radars = $storage.getString("radars");
    value = radars != null
        ? ((jsonDecode(radars) as List).cast<Map>().map((e) => e.cast<String, Object?>()))
            .map((e) => SpeedRadar.fromMap(e))
            .toList()
        : _geofenceList
            .map(
              (e) => SpeedRadar(
                type: "type",
                direction: "direction",
                speed: 50,
                position: LatLng(e.latitude, e.longitude),
              ),
            )
            .toList();
    notifyListeners();
  }

  static final _geofenceList = <Geofence>[
    Geofence(
      id: 'radar_1',
      latitude: 41.3404,
      longitude: 69.2115,
      radius: [
        GeofenceRadius(
          id: 'radius_200m',
          length: 400,
        ),
        GeofenceRadius(
          id: 'radius_150m',
          length: 200,
        ),
        GeofenceRadius(
          id: 'radius_100m',
          length: 50,
        ),
      ],
    ),
    Geofence(
      id: 'radar_2',
      latitude: 41.3359,
      longitude: 69.2070,
      radius: [
        GeofenceRadius(
          id: 'radius_200m',
          length: 400,
        ),
        GeofenceRadius(
          id: 'radius_150m',
          length: 200,
        ),
        GeofenceRadius(
          id: 'radius_100m',
          length: 50,
        ),
      ],
    ),
  ];
}
