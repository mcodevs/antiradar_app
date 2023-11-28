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

  List<Geofence> _geofenceList = [];

  final _geofenceService = GeofenceService.instance.setup(
    interval: 100,
    accuracy: 100,
    loiteringDelayMs: 600,
    statusChangeDelayMs: 100,
    useActivityRecognition: true,
    allowMockLocations: false,
    printDevLog: false,
    geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
  );

  @override
  void initState() {
    super.initState();
    getPermission();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _geofenceService.addLocationChangeListener((location) {
        print(location.toJson());
      });
      _geofenceService.addGeofenceStatusChangeListener(
          (geofence, geofenceRadius, geofenceStatus, location) async {
        if (geofenceStatus == GeofenceStatus.ENTER) {
          print("Kirdi");
        }
      });
    });

  }

  void getPermission() async {
    final permission = await Geolocator.checkPermission();
    print(permission);
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
