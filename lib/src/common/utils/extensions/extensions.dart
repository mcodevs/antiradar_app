import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/utils/typedefs/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension SetExtension on Set<RadarModel> {
  Set<Marker> toMarkers(RadarTappedCallBack onTap) => map((e) => e.toMarker(onTap)).toSet();
}

extension ContextExtension on BuildContext {
  Future<T?> go<T>(String route) async => Navigator.pushNamed(this, route);

  Future<void> goAndRemoveUntil(String route) async =>
      Navigator.pushNamedAndRemoveUntil(this, route, (route) => false);
}

extension NumExtension on num {
  SizedBox get vertical => SizedBox(height: toDouble());
  SizedBox get horizontal => SizedBox(width: toDouble());

}
