import 'package:antiradar/src/common/utils/typedefs/typedefs.dart';
import 'package:geofence_service/geofence_service.dart';
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

  Geofence toGeofence() => Geofence(
      data: this,
      id: id,
      latitude: position.latitude,
      longitude: position.longitude,
      radius: [
        GeofenceRadius(id: "600", length: 600),
        GeofenceRadius(id: "300", length: 300),
        GeofenceRadius(id: "150", length: 150),
        GeofenceRadius(id: "50", length: 50),
      ],
    );

  @override
  int get hashCode => id.hashCode;
}

