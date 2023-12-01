import 'dart:async';

import 'package:antiradar/src/ui/map/services/radar_services.dart';
import 'package:antiradar/src/ui/map/widgets/top_widget.dart';
import 'package:antiradar/src/ui/map/widgets/top_widget.dart';
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

  final RadarServices radarServices = RadarServices();

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
    if (geofenceStatus == GeofenceStatus.ENTER && res <= 30) {
      _geofenceStreamController.sink.add(
        MapEvent(distance: geofenceRadius.length, radarName: geofence.id),
      );
      await flutterTts
          .speak("До радара осталось ${geofenceRadius.length.toInt()} метров");
    } else if (geofenceStatus == GeofenceStatus.EXIT) {
      _geofenceStreamController.sink.add(null);
    }
  }

  void _onActivityChanged(Activity prevActivity, Activity currActivity) {}

  void _onLocationChanged(Location location) {}

  void _onLocationServicesStatusChanged(bool status) {}

  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      // print('Undefined error: $error');
      return;
    }

    // print('ErrorCode: $errorCode');
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
    radarServices.readRadars();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService
          .addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(
          _onLocationServicesStatusChanged);
      _geofenceService.addActivityChangeListener(_onActivityChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(radarServices.toGeofence()).catchError(_onError);
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
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
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
                          zoom: 17,
                          tilt: 90,
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
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: ValueListenableBuilder(
                  valueListenable: radarServices,
                  builder: (context, radars, child) {
                    return GoogleMap(
                      onMapCreated: (controller) {
                        _controller.complete(controller);
                        Geolocator.getCurrentPosition().then(
                          (value) => controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(value.latitude, value.longitude),
                                bearing: value.heading,
                                zoom: 17,
                                tilt: 90,
                              ),
                            ),
                          ),
                        );
                      },
                      initialCameraPosition: _kLake,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      markers: radars.map((e) {
                        return Marker(
                          markerId: MarkerId(
                              "${e.position.latitude}${e.position.longitude}"),
                          icon: BitmapDescriptor.defaultMarker,
                          position:
                              LatLng(e.position.latitude, e.position.longitude),
                        );
                      }).toSet(),
                    );
                  }),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 40,
              child: StreamBuilder<double>(
                stream: _speedStreamController.stream,
                builder: (context, snapshot) {
                  return CustomIndicator(
                    bottomText: "СТАТСИОНАРНЫЙ РАДАР НА СПИНУ",
                    text1: "${snapshot.data?.toInt() ?? 0}",
                    text2: "600",
                  );
                }
              ),
            ),
            const CustomIndicator(
              bottomText: "СТАТСИОНАРНЫЙ РАДАР НА СПИНУ",
              text1: "120",
              text2: "600",
            ),
          ],
        ),
      ),
    );
  }
}
