import 'dart:convert';

import 'package:antiradar/main.dart';
import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/data/models/radars/speed_radar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RadarServices {
  RadarServices();

  List<Map<String,Object?>> radars = [];

  Future<void> addRadar(String type,int speed,LatLng position,String direction) async {
    SpeedRadar radarModel =  SpeedRadar(type: type, direction: direction, speed: speed, position: position);
    radars.add(radarModel.toMap());
    await $storage.setString("radars", jsonEncode(radars));
  }

  Future<List<RadarModel>> readRadars() async {
    return (jsonDecode($storage.getString("radars") as String) as List<SpeedRadar>).map((e) => SpeedRadar.fromMap(e as Map<String,Object?>)).toList();
  }

}