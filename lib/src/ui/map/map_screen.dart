import 'dart:async';

import 'package:antiradar/src/common/constants/app_images.dart';
import 'package:antiradar/src/ui/map/services/radar_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common/constants/app_colors.dart';
import '../pages/home/widget/confiro_code.dart';

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

  BitmapDescriptor? icon;

  void getIcon() async {
    icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/icons/camera.png",
      mipmaps: false,
    );
    setState(() {});
  }

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
    getIcon();
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

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Column(
                children: [
                  const Text(
                    "  Hurmatli foydalanuvchi siz\n     "
                    " tizimda muvaffaqiyatli\n        "
                    "ro'yhatdan o'tdingiz! Dasturdan foydalanish uchun\n        "
                    "hisobingizni to'ldiring",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Hisobni to'ldirish",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  
  final TextEditingController speedController=TextEditingController();

  void _showDialog() async{
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "MA'LUMOTLAR QO'SHISH",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text("Tezlik chegarasini kiriting"),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: TextField(
                        keyboardType: TextInputType.number,
                      controller: speedController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      ),
                    ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor),
                      onPressed: () {
                        //Dialokni yopib ketish
                        Navigator.of(context).pop(speedController.text);
                      },
                      child: const Text(
                        "SAQLASH",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     final controller = await _controller.future;
        //     if (subscription == null) {
        //       subscription =
        //           Geolocator.getPositionStream().listen((event) async {
        //         await controller.animateCamera(
        //           CameraUpdate.newCameraPosition(
        //             CameraPosition(
        //               target: LatLng(event.latitude, event.longitude),
        //               // bearing: event.heading,
        //               zoom: 15,
        //             ),
        //           ),
        //         );
        //       });
        //     } else if (subscription?.isPaused ?? false) {
        //       subscription?.resume();
        //     } else {
        //       subscription?.pause();
        //     }
        //   },
        //   child: StreamBuilder<double>(
        //       stream: _speedStreamController.stream,
        //       builder: (context, snapshot) {
        //         return Text("${snapshot.data?.toInt() ?? 0}");
        //       }),
        // ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ConfirmButton(
              onPressed: () => {},
              radius: 20,
              size: 63,
              child: Image(
                image: AssetImage(AppImages.setting),
              ),
            ),
            ConfirmButton(
              onPressed: () => {
                _showDialog(),
              },
              size: 57,
              child: Image(
                image: AssetImage(AppImages.add),
              ),
            ),
            ConfirmButton(
              onPressed: () => {},
              size: 63,
              child: Image(
                image: AssetImage(AppImages.zoom),
              ),
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
                        Geolocator.getCurrentPosition().then((event) async {
                          await controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(event.latitude, event.longitude),
                                bearing: event.heading,
                                tilt: 90,
                                zoom: 17,
                              ),
                            ),
                          );
                        });
                      },
                      initialCameraPosition: _kLake,
                      myLocationButtonEnabled: false,
                      compassEnabled: false,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      markers: radarServices.toGeofence().map((e) {
                        return Marker(
                          markerId: MarkerId(e.id),
                          icon: icon ?? BitmapDescriptor.defaultMarker,
                          position: LatLng(e.latitude, e.longitude),
                        );
                      }).toSet(),
                    );
                  }),
            ),
              Positioned(
              top: 20,
              left: 12,
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 75,
                  width: 85,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<double>(
                            stream: _speedStreamController.stream,
                            builder: (context, snapshot) {
                              return Text(
                                "${snapshot.data?.toInt() ?? 0}",
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              );
                            }),
                        const Text(
                          "km/s",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
             Positioned(
              top: 105,
              left: 15,
              child: GestureDetector(
                onTap: (){

                },
                child: const SizedBox(
                  height: 80,
                  width: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Center(
                              child: Text(
                            "110",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showCustomDialog();
                      },
                      child: const Text('Show Dialog'),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
