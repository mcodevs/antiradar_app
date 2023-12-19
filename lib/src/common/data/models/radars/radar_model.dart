import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

abstract class RadarModel {
  final LatLng position;
  final int speed;
  final String id;
  RadarModel({String? id, required this.position, required this.speed}) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap();
  Marker toMarker();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RadarModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}