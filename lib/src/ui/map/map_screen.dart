import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapEvent {
  final double distance;
  final String radarName;

  MapEvent({
    required this.distance,
    required this.radarName,
  });
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _kLake = CameraPosition(
    target: LatLng(41.3276, 69.2293),
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late FlutterTts flutterTts;

  StreamSubscription? subscription;

  Future<void> init() async {
    flutterTts = FlutterTts();
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("ru");
  }

  final _geofenceStreamController = StreamController<MapEvent?>();
  final _speedStreamController = StreamController<double>();

  final _geofenceList = <Geofence>[
    Geofence(
      id: 'radar_1',
      latitude: 41.3261,
      longitude: 69.2334,
      radius: [
        GeofenceRadius(
          id: 'radius_200m',
          length: 400,
        ),
        GeofenceRadius(
          id: 'radius_150m',
          length: 200,
        ),
        GeofenceRadius(
          id: 'radius_100m',
          length: 50,
        ),
      ],
    ),
    Geofence(
      id: 'radar_2',
      latitude: 41.3302,
      longitude: 69.2228,
      radius: [
        GeofenceRadius(
          id: 'radius_200m',
          length: 400,
        ),
        GeofenceRadius(
          id: 'radius_150m',
          length: 200,
        ),
        GeofenceRadius(
          id: 'radius_100m',
          length: 50,
        ),
      ],
    ),
  ];

  Future<void> _onGeofenceStatusChanged(
    Geofence geofence,
    GeofenceRadius geofenceRadius,
    GeofenceStatus geofenceStatus,
    Location location,
  ) async {
    final bearing = Geolocator.bearingBetween(
      location.latitude,
      location.longitude,
      geofence.latitude,
      geofence.longitude,
    );

    if (geofenceStatus == GeofenceStatus.ENTER &&
        (location.heading - bearing >= 320)) {
      print("----------------------bear(${geofence.id}): ${bearing}");
      print(
          "----------------------heading(${geofence.id}): ${location.heading}");
      _geofenceStreamController.sink.add(
        MapEvent(distance: geofenceRadius.length, radarName: geofence.id),
      );
      await flutterTts
          .speak("До радара осталось ${geofenceRadius.length.toInt()} метров");
    } else if (geofenceStatus == GeofenceStatus.EXIT) {
      _geofenceStreamController.sink.add(
        null,
      );
    }
  }

// This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    // print('prevActivity: ${prevActivity.toJson()}');
    // print('currActivity: ${currActivity.toJson()}');
    // _activityStreamController.sink.add(currActivity);
  }

// This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {}

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
  void dispose() {
    flutterTts.stop();
    super.dispose();
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
    init();
    Geolocator.getPositionStream().listen((event) {
      _speedStreamController.sink.add(event.speed);
      print(event.speedAccuracy);
    });
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final controller = await _controller.future;
            if (subscription == null) {
              subscription =
                  Geolocator.getPositionStream().listen((event) async {
                await controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(event.latitude, event.longitude),
                      bearing: event.heading,
                      zoom: 15,
                    ),
                  ),
                );
              });
            } else if (subscription?.isPaused ?? false) {
              subscription?.resume();
            } else {
              subscription?.pause();
            }
          },
          child: StreamBuilder<double>(
              stream: _speedStreamController.stream,
              builder: (context, snapshot) {
                return Text("${snapshot.data?.toInt() ?? 0}");
              }),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: _kLake,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: _geofenceList.map((e) {
                  return Marker(
                    markerId: MarkerId(e.id),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(e.latitude, e.longitude),
                  );
                }).toSet(),
                circles: _geofenceList
                    .map((g) {
                      return g.radius.map((e) {
                        return Circle(
                          circleId: CircleId(g.id),
                          center: LatLng(g.latitude, g.longitude),
                          radius: e.length,
                          strokeWidth: 4,
                        );
                      });
                    })
                    .expand((element) => element)
                    .toSet(),
              ),
            ),
            Expanded(
              child: Center(
                child: StreamBuilder<MapEvent?>(
                    stream: _geofenceStreamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return Text("Hech qanday radar yo'q");
                      } else {
                        return Text(
                          "Radargacha masofa: ${snapshot.data!.distance}\nRadar nomi: ${snapshot.data!.radarName}",
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
