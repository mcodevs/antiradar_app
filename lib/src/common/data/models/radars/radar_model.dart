import 'package:antiradar/src/common/utils/typedefs/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

abstract class RadarModel {
  final LatLng position;
  final int speed;
  final String id;
  RadarModel({String? id, required this.position, required this.speed}) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap();
  Marker toMarker(RadarTappedCallBack onTap);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RadarModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

