import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpeedRadar extends RadarModel {
  final String type;
  final String direction;

  SpeedRadar({
    required this.type,
    required this.direction,
    required super.speed,
    required super.position,
  });

  factory SpeedRadar.fromMap(Map<String, dynamic> map) {
    return SpeedRadar(
      type: map['type'] as String,
      direction: map['direction'] as String,
      speed: map['speed'] as int,
      position: LatLng.fromJson((map['position'] as List).cast<double>())!,
    );
  }

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
}
