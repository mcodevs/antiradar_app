import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/data/services/flutter_tts_service.dart';
import 'package:antiradar/src/common/utils/extensions/extensions.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:geolocator/geolocator.dart';

class Geofencing {
  static late final GeofenceService _service;

  static String? currentRadar;

  static void initialize() =>
      _service = GeofenceService.instance.setup(
        interval: 200,
        accuracy: 100,
        loiteringDelayMs: 6000,
        statusChangeDelayMs: 1000,
        useActivityRecognition: true,
        allowMockLocations: false,
        printDevLog: true,
        geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
      );

  static Future<void> getRadars(List<RadarModel> radars) async {
    await _service.start(radars.toGeofence());
  }

  static updateRadars(List<RadarModel> radars) {
    _service.clearGeofenceList();
    _service.addGeofenceList(radars.toGeofence());
  }

  static void close() {
    _service.clearAllListeners();
    clear();
  }

  static void clear() {
    _service.clearGeofenceList();
  }


  static void listenRadar({
    required void Function(RadarModel radar, int distance) onInside,
    required void Function() onOutside,
  }) {
    _service.addGeofenceStatusChangeListener((Geofence geofence,
        GeofenceRadius geofenceRadius,
        GeofenceStatus geofenceStatus,
        Location location,) async {
      final isInside = _isInside(
        radar: geofence,
        userLocation: location,
      );

      if (geofenceStatus == GeofenceStatus.ENTER &&
          isInside &&
          ((currentRadar == null) || (currentRadar == geofence.id))) {
        TTSService.speakMeter(geofenceRadius.length.toInt());
        currentRadar = geofence.id;
        onInside(geofence.data, geofenceRadius.length.toInt());
      } else if (geofenceStatus == GeofenceStatus.ENTER &&
          isInside &&
          ((currentRadar != null) || (currentRadar != geofence.id))) {
        TTSService.speakOtherRadar();
      } else if (geofenceStatus == GeofenceStatus.EXIT && currentRadar == geofence.id) {
        currentRadar = null;
        onOutside();
      }
    });
  }

  static void addRadar(RadarModel radar) {
    _service.addGeofence(radar.toGeofence());
  }

  static void removeRadar(String id) {
    _service.removeGeofenceById(id);
  }

  static void updateRadar(RadarModel radar) {
    removeRadar(radar.id);
    addRadar(radar);
  }

  static bool _isInside({
    required Location userLocation,
    required Geofence radar,
  }) {
    var bearing = Geolocator.bearingBetween(
      userLocation.latitude,
      userLocation.longitude,
      radar.latitude,
      radar.longitude,
    );

    bearing = bearing.isNegative ? bearing + 360 : bearing;

    return (bearing - userLocation.heading).abs() <= 30;
  }
}
