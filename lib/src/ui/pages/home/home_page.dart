import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<YandexMapController> _controller =
      Completer<YandexMapController>();

  Future<void> getPermission() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        onMapCreated: (controller) => _controller.complete(controller),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final controller = await _controller.future;
              final current = await Geolocator.getCurrentPosition();
              controller
                  .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: Point(
                    latitude: current.latitude, longitude: current.longitude),
                azimuth: current.heading,
                zoom: 20,
                tilt: 70,
              )));
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              final controller = await _controller.future;
              final current = await Geolocator.getCurrentPosition();
              controller
                  .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: Point(
                    latitude: current.latitude, longitude: current.longitude),
                azimuth: current.heading,
                zoom: 20,
                tilt: 70,
              )));
            },
            child: const Icon(Icons.navigation_rounded),
          ),
        ],
      ),
    );
  }
}
