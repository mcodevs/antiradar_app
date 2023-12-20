import 'dart:async';

import 'package:antiradar/src/common/constants/app_icons.dart';
import 'package:antiradar/src/common/constants/app_images.dart';
import 'package:antiradar/src/common/data/models/radars/speed_radar.dart';
import 'package:antiradar/src/ui/pages/map/cubit/radar_cubit.dart';
import 'package:antiradar/src/ui/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/constants/app_colors.dart';
import 'mapBloc/map_bloc.dart';
import 'widgets/top_widget.dart';

class MapEventModel {
  final double distance;
  final String radarName;

  MapEventModel({
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
  late MapBloc mapBloc;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  StreamSubscription? subscription;
  late RadarCubit radarCubit;

  Future<void> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  final _geofenceStreamController = StreamController<MapEventModel?>();

  CameraPosition userCamera(Position position) {
    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      bearing: position.heading,
      tilt: 90,
      zoom: 17,
    );
  }

  Future<void> getUserCameraPosition() async {
    final position = await Geolocator.getCurrentPosition();
    final controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        userCamera(position),
      ),
    );
  }

  @override
  void dispose() async {
    radarCubit.close();
    (await _controller.future).dispose();
    _geofenceStreamController.close();
    mapBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    radarCubit = RadarCubit();
    mapBloc = MapBloc(radarCubit: radarCubit)
      ..add(const MapEvent.radiusRadar(10));
  }

  // void _showCustomDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         child: SizedBox(
  //           height: 300,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
  //             child: Column(
  //               children: [
  //                 const Text(
  //                   "  Hurmatli foydalanuvchi siz\n     "
  //                   " tizimda muvaffaqiyatli\n        "
  //                   "ro'yhatdan o'tdingiz! Dasturdan foydalanish uchun\n        "
  //                   "hisobingizni to'ldiring",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
  //                 ),
  //                 const SizedBox(height: 40),
  //                 SizedBox(
  //                   height: 50,
  //                   width: 250,
  //                   child: ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                         backgroundColor: AppColors.greenColor),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text(
  //                       "Hisobni to'ldirish",
  //                       style: TextStyle(color: Colors.white, fontSize: 18),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  final TextEditingController speedController = TextEditingController();

  Future<String?> _showDialog() async => await showDialog(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                            backgroundColor: AppColors.primary),
                        onPressed: () {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mapBloc,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomFAB(
                  onPressed: () => {},
                  radius: 20,
                  size: 63,
                  child: Image(
                    image: AssetImage(AppImages.setting),
                  ),
                ),
                CustomFAB(
                  onPressed: () async {
                    final speed = await _showDialog();
                    if (speed != null) {
                      // final position = await Geolocator.getCurrentPosition();
                      // final radar = await radarServices.addRadar(
                      //   "type",
                      //   int.tryParse(speed) ?? 60,
                      //   LatLng(position.latitude, position.longitude),
                      //   "direction",
                      // );
                      // _geofenceService.addGeofence(radar.toGeofence());
                    }
                  },
                  size: 57,
                  child: Image(
                    image: AssetImage(AppImages.add),
                  ),
                ),
                CustomFAB(
                  onPressed: () async {
                    final controller = await _controller.future;
                    final position = await Geolocator.getCurrentPosition();
                    await controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        userCamera(position),
                      ),
                    );
                    if (subscription == null) {
                      subscription =
                          Geolocator.getPositionStream().listen((event) async {
                        await controller.animateCamera(
                          CameraUpdate.newCameraPosition(
                            userCamera(event),
                          ),
                        );
                      });
                    } else if (subscription?.isPaused ?? false) {
                      subscription?.resume();
                    } else {
                      subscription?.pause();
                    }
                    setState(() {});
                  },
                  size: 63,
                  color: ((subscription?.isPaused ?? false) ||
                          subscription == null)
                      ? AppColors.primary
                      : AppColors.secondary,
                  child: Image(
                    image: AssetImage(AppImages.zoom),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: BlocBuilder<MapBloc, MapState>(
                  buildWhen: (previous, current) => current.maybeMap(
                    orElse: () => true,
                    radarTapped: (value) => false,
                  ),
                  builder: (context, state) {
                    return GoogleMap(
                      onTap: (argument) async {
                        final res = await _showDialog();
                        if (res != null) {
                          SpeedRadar radar = SpeedRadar(
                            type: "type",
                            direction: "direction",
                            speed: int.parse(res),
                            position:
                                LatLng(argument.latitude, argument.longitude),
                          );
                          mapBloc.add(MapEvent.addRadar(radar));
                        }
                      },
                      initialCameraPosition:
                          const CameraPosition(target: LatLng(45, 89)),
                      markers: state.maybeMap(
                        orElse: () => {},
                        success: (value) {
                          print(value.markers.length);
                          return value.markers;
                        },
                      ),
                      onMapCreated: (controller) {
                        _controller.complete(controller);
                        Geolocator.getCurrentPosition().then((event) async {
                          await controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              userCamera(event),
                            ),
                          );
                        });
                      },
                      onCameraMoveStarted: () {
                        state.maybeMap(
                          orElse: () {},
                          radarTapped: (value) => mapBloc.add(
                            const MapEvent.radiusRadar(100),
                          ),
                        );
                      },
                      myLocationButtonEnabled: false,
                      compassEnabled: false,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: BlocBuilder<MapBloc, MapState>(
                  builder: (context, state) => state.maybeMap(
                    orElse: () => const SizedBox.shrink(),
                    radarTapped: (value) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 87.r),
                            child: SizedBox(
                              height: 40.h,
                              width: 240.w,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 3.r,
                                      spreadRadius: 1.r,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.r),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          mapBloc.add(
                                            MapEvent.updateRadar(
                                              value.radar,
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Tahrirlash",
                                        ),
                                      ),
                                    ),
                                    const VerticalDivider(),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          mapBloc.add(
                                            MapEvent.removeRadar(
                                              value.radar,
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "O'chirish",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(0, -95, 0),
                            child: Image(
                              height: 50.r,
                              image: const AssetImage(AppIcons.rasm),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 160,
              //   left: 12,
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: SizedBox(
              //       height: 75,
              //       width: 85,
              //       child: DecoratedBox(
              //         decoration: const BoxDecoration(
              //             color: AppColors.primary,
              //             borderRadius: BorderRadius.all(Radius.circular(15))),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               "230",
              //               style: const TextStyle(
              //                 fontSize: 30,
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //             const Text(
              //               "km/s",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const Positioned(
              //   top: 250,
              //   left: 15,
              //   child: Limit(speed: "100"),
              // ),
              Positioned(
                top: 10,
                right: 15,
                left: 15,
                child: StreamBuilder<RadarState>(
                    stream: radarCubit.stream,
                    initialData: radarCubit.state,
                    builder: (context, snapshot) {
                      return snapshot.data!.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        visible: (value) => CustomIndicator(
                          bottomText: "СТАТСИОНАРНЫЙ РАДАР НА СПИНУ",
                          speed: value.model.speed.toString(),
                          distance: value.distance.toString(),
                          speedLimit: value.model.speed.toString(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Limit extends StatelessWidget {
  final String speed;
  final double? dimension;

  const Limit({
    super.key,
    required this.speed,
    this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox.square(
        dimension: dimension ?? 80.r,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.all(
              Radius.circular(200),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    speed,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
