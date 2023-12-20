import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/utils/typedefs/typedefs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SpeedLimit extends RadarModel {
  SpeedLimit({
    required super.position,
    required super.speed,
  });

  @override
  Map<String, Object?> toMap() => {
        'id': id,
        'speed': speed,
        'position': position.toJson(),
      };

  factory SpeedLimit.fromMap(Map<String, Object?> map) {
    return SpeedLimit(
      position: LatLng.fromJson((map['position'] as List).cast<double>())!,
      speed: map['speed'] as int,
    );
  }

  @override
  Marker toMarker(RadarTappedCallBack onTap) {
    //  implement toMarker
    throw UnimplementedError();
  }


}
