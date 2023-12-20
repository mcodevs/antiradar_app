import 'package:antiradar/src/common/configurations/initialize.dart';
import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/utils/typedefs/typedefs.dart';
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
      'id': id,
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
  Marker toMarker(RadarTappedCallBack onTap) {
    return Marker(
      onTap: () => onTap(this),
      markerId: MarkerId(id),
      position: position,
      icon: GetIcon.icon,
    );
  }

}
