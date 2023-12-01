import 'dart:async';

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
      latitude: 41.3404,
      longitude: 69.2115,
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
      latitude: 41.3359,
      longitude: 69.2070,
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
    var bearing = Geolocator.bearingBetween(
      location.latitude,
      location.longitude,
      geofence.latitude,
      geofence.longitude,
    );

    bearing = bearing.isNegative ? bearing + 360 : bearing;

    final res = (bearing - location.heading).abs();
    print("result: -------------$res");
    if (geofenceStatus == GeofenceStatus.ENTER && res <= 30) {
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

  void _onActivityChanged(Activity prevActivity, Activity currActivity) {}

  void _onLocationChanged(Location location) {}

  void _onLocationServicesStatusChanged(bool status) {}

  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void dispose() async {
    flutterTts.stop();
    (await _controller.future).dispose();
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
                      // bearing: event.heading,
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
          ],
        ),
      ),
    );
  }
}
