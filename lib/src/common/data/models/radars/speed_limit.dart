import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpeedLimit extends RadarModel {
  SpeedLimit({
    required super.position,
    required super.speed,
  });

  Map<String, Object?> toMap() => {
        'speed': speed,
        'position': position.toJson(),
      };

  factory SpeedLimit.fromMap(Map<String, Object?> map) {
    return SpeedLimit(
      position: LatLng.fromJson((map['position'] as List).cast<double>())!,
      speed: map['speed'] as int,
    );
  }
}
