import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:antiradar/src/common/data/services/local_db_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';

part 'map_state.dart';

part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState.loading()) {
    on<MapEvent>(
      (event, emit) => event.map(
        addRadar: (value) => _addRadar(emit, value),
        removeRadar: (value) => _removeRadar(emit, value),
        updateRadar: (value) => _updateRadar(emit, value),
        radiusRadar: (value) => _radiusRadar(emit, value),
      ),
    );
  }

  Future<void> _addRadar(Emitter<MapState> emit, _AddRadar value) async {
    try {
      final radars = await LocalDBService.addRadar(value.model);
      emit(MapState.success(radars.toMarkers()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeRadar(Emitter<MapState> emit, _RemoveRadar value) async {
    try {
      final radars = await LocalDBService.remove(value.model);
      emit(MapState.success(radars.toMarkers()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateRadar(Emitter<MapState> emit, _UpdateRadar value) async {
    try {
      final radars = await LocalDBService.update(value.model);
      emit(MapState.success(radars.toMarkers()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _radiusRadar(Emitter<MapState> emit, _RadiusRadar value) async {
    final radars = LocalDBService.readRadars();
    emit(MapState.success(radars.toMarkers()));
  }
}


extension on Set<RadarModel> {
  Set<Marker> toMarkers() => map((e) => e.toMarker()).toSet();
}
