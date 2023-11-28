import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart' hide LocationPermission;
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<YandexMapController> _controller =
      Completer<YandexMapController>();
  int count = 1;

  final radar1 = const Point(latitude: 41.3276, longitude: 69.2293);
  final radar2 = const Point(latitude: 41.3286, longitude: 69.2257);

  // Create a [Geofence] list.
  late final _geofenceList = <Geofence>[
    Geofence(
      id: 'radar_1',
      latitude: radar1.latitude,
      longitude: radar1.longitude,
      radius: [
        GeofenceRadius(id: 'radius_100m', length: 100, data: " Radar 1"),
      ],
    ),
    Geofence(
      id: 'radar_2',
      latitude: radar2.latitude,
      longitude: radar2.longitude,
      radius: [
        GeofenceRadius(id: 'radius_100m', length: 100, data: "Bu radar 2"),
      ],
    ),
  ];

  late final _geofenceService = GeofenceService.instance.setup(
    interval: 200,
    accuracy: 100,
    loiteringDelayMs: 6000,
    statusChangeDelayMs: 1000,
    useActivityRecognition: true,
    allowMockLocations: false,
    printDevLog: false,
    geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
  );

  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(
    Geofence geofence,
    GeofenceRadius geofenceRadius,
    GeofenceStatus geofenceStatus,
    Location location,
  ) async {}

// This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    // print('prevActivity: ${prevActivity.toJson()}');
    // print('currActivity: ${currActivity.toJson()}');
    // _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    print('location: ${location.toJson()}');
  }

// This function is to be called when a location services status change occurs
// since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    // print('isLocationServicesEnabled: $status');
  }

// This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void initState() {
    super.initState();
    getPermission();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService
          .addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(
          _onLocationServicesStatusChanged);
      _geofenceService.addActivityChangeListener(_onActivityChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(_geofenceList).catchError(_onError);
    });
  }

  void getPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        onMapCreated: (controller) async {
          _controller.complete(controller);
          await controller.toggleUserLayer(
            visible: true,
            autoZoomEnabled: true,
          );
        },
        onTrafficChanged: (trafficLevel) {
          print(trafficLevel);
        },
        mapObjects: _geofenceList.map((e) {
          return PlacemarkMapObject(
            mapId: MapObjectId(e.id),
            point: Point(latitude: e.latitude, longitude: e.longitude),
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image:
                    BitmapDescriptor.fromAssetImage("assets/icons/place.png"),
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final controller = await _controller.future;
              final point = await Geolocator.getCurrentPosition();
              await controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: Point(
                        latitude: point.latitude, longitude: point.longitude),
                    tilt: 60,
                    azimuth: point.heading,
                    zoom: 15,
                  ),
                ),
              );
            },
            child: const Icon(Icons.navigation_rounded),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              final current = await Geolocator.getCurrentPosition();
              _geofenceList.add(
                Geofence(
                  id: "radar${count++}",
                  latitude: current.latitude,
                  longitude: current.longitude,
                  radius: [
                    GeofenceRadius(id: "100", length: 100),
                  ],
                ),
              );
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
