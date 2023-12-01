import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class RadarModel {
  final LatLng position;
  final int speed;
  const RadarModel({required this.position, required this.speed});
}