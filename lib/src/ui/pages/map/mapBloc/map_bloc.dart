import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/data/services/geofencing.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:antiradar/src/common/utils/extensions/extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../cubit/radar_cubit.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final RadarCubit radarCubit;
  MapBloc({required this.radarCubit}) : super(const MapState.loading()) {
    on<MapEvent>(
      (event, emit) => event.map(
        addRadar: (value) => _addRadar(emit, value),
        removeRadar: (value) => _removeRadar(emit, value),
        updateRadar: (value) => _updateRadar(emit, value),
        radiusRadar: (value) => _radiusRadar(emit, value),
        tapRadar: (value) => _onTapRadar(emit, value),
      ),
    );
  }

  void _radarTapped(RadarModel radar) {
    add(MapEvent.tapRadar(radar));
  }

  Future<void> _addRadar(Emitter<MapState> emit, _AddRadar value) async {
    try {
      Geofencing.addRadar(value.model);
      final radars = await LocalDBService.addRadar(value.model);
      emit(MapState.success(radars.toMarkers(_radarTapped)));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeRadar(Emitter<MapState> emit, _RemoveRadar value) async {
    try {
      Geofencing.removeRadar(value.model.id);
      final radars = await LocalDBService.remove(value.model);
      emit(MapState.success(radars.toMarkers(_radarTapped)));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateRadar(Emitter<MapState> emit, _UpdateRadar value) async {
    try {
      Geofencing.updateRadar(value.model);
      final radars = await LocalDBService.update(value.model);
      emit(MapState.success(radars.toMarkers(_radarTapped)));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _radiusRadar(Emitter<MapState> emit, _RadiusRadar value) async {
    final radars = LocalDBService.readRadars();
    Geofencing.close();
    Geofencing.getRadars(radars.toList());
    Geofencing.listenRadar(
      onInside: (radar,distance) {
        radarCubit.onInside(radar, distance);
      },
      onOutside: () {
        radarCubit.outSide();
      },
    );
    emit(MapState.success(radars.toMarkers(_radarTapped)));
  }

  void _onTapRadar(Emitter<MapState> emit, _TapRadar value) {
    state.maybeMap(
      orElse: () {},
      success: (state) {
        emit(MapState.radarTapped(value.model, state.markers));
      },
      radarTapped: (state) {
        emit(MapState.radarTapped(value.model, state.markers));
      },
    );
  }
}
