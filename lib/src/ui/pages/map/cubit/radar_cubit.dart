import 'package:antiradar/src/common/data/models/radars/radar_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'radar_state.dart';

part 'radar_cubit.freezed.dart';

class RadarCubit extends Cubit<RadarState> {
  RadarCubit() : super(const RadarState.notVisible());

  void onInside(RadarModel model, int distance) {
    emit(RadarState.visible(model, distance));
  }

  void outSide() {
    emit(const RadarState.notVisible());
  }
}
