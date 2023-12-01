import 'dart:convert';

import 'package:antiradar/main.dart';
import 'package:antiradar/src/common/data/models/radars/speed_radar.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RadarServices extends ValueNotifier<List<SpeedRadar>> {
  RadarServices({List<SpeedRadar>? radars}) : super(radars ?? []);

  List<Geofence> toGeofence() {
    return value
        .map(
          (e) => Geofence(
            data: e,
            id: "${e.position.latitude}${e.position.longitude}",
            latitude: e.position.latitude,
            longitude: e.position.longitude,
            radius: [
              GeofenceRadius(id: "600", length: 600),
              GeofenceRadius(id: "300", length: 300),
              GeofenceRadius(id: "150", length: 150),
              GeofenceRadius(id: "50", length: 50),
            ],
          ),
        )
        .toList();
  }

  Future<void> addRadar(
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
  }

  void readRadars() {
    final radars = $storage.getString("radars");
    value = radars != null
        ? (jsonDecode(radars) as List<SpeedRadar>)
            .map((e) => SpeedRadar.fromMap(e as Map<String, Object?>))
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
