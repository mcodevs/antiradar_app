import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final ValueNotifier<String> changeListener = ValueNotifier("");

  final radar1 = const LatLng(41.3276, 69.2293);
  final radar2 = const LatLng(41.3286, 69.2257);

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

  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(
    Geofence geofence,
    GeofenceRadius geofenceRadius,
    GeofenceStatus geofenceStatus,
    Location location,
  ) async {
    if(geofenceStatus == GeofenceStatus.EXIT) {
      changeListener.value = "";
    } else {
      changeListener.value = geofenceRadius.data as String;
    }
  }

// This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    // print('prevActivity: ${prevActivity.toJson()}');
    // print('currActivity: ${currActivity.toJson()}');
    // _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    // print('location: ${location.toJson()}');
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
    Geolocator.requestPermission();
  }

  final _geofenceService = GeofenceService.instance.setup(
    interval: 200,
    accuracy: 100,
    loiteringDelayMs: 6000,
    statusChangeDelayMs: 1000,
    useActivityRecognition: true,
    allowMockLocations: false,
    printDevLog: false,
    geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        markers: _geofenceList.map((e) {
          return Marker(
            markerId: MarkerId(e.id),
            position: LatLng(e.latitude, e.longitude),
          );
        }).toSet(),
        circles: _geofenceList.map((e) {
          return Circle(
            circleId: CircleId(e.id),
            center: LatLng(e.latitude, e.longitude),
            radius: e.radius.first.length,
          );
        }).toSet(),
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _kLake,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {},
        label: ValueListenableBuilder(
          valueListenable: changeListener,
          builder: (context, value, child) {
            return Text(value);
          },
        ),
      ),
    );
  }
}
