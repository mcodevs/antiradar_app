import 'package:antiradar/src/common/configurations/initialize.dart';
import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SpeedRadar extends RadarModel {
  final String type;
  final String direction;

  SpeedRadar({
    super.id,
    required this.type,
    required this.direction,
    required super.speed,
    required super.position,
  });

  Geofence toGeofence() {
    return Geofence(
      data: this,
      id: "${position.latitude}${position.longitude}",
      latitude: position.latitude,
      longitude: position.longitude,
      radius: [
        GeofenceRadius(id: "600", length: 600),
        GeofenceRadius(id: "300", length: 300),
        GeofenceRadius(id: "150", length: 150),
        GeofenceRadius(id: "50", length: 50),
      ],
    );
  }

  factory SpeedRadar.fromMap(Map<String, dynamic> map) {
    return SpeedRadar(
      id: map['id'] as String?,
      type: map['type'] as String,
      direction: map['direction'] as String,
      speed: map['speed'] as int,
      position: LatLng.fromJson((map['position'] as List).cast<double>())!,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'direction': direction,
      'speed': speed,
      'position': position.toJson(),
    };
  }

  SpeedRadar copyWith({
    String? type,
    String? direction,
    LatLng? position,
    int? speed,
  }) => SpeedRadar(
      type: type ?? this.type,
      direction: direction ?? this.direction,
      position: position ?? this.position,
      speed: speed ?? this.speed,
    );


  @override
  Marker toMarker() {
    return Marker(
      onTap: () {

      },
      markerId: MarkerId(id),
      position: position,
      icon: GetIcon.icon,
    );
  }

}
