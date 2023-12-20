part of 'radar_cubit.dart';

@freezed
class RadarState with _$RadarState {
  const factory RadarState.visible(RadarModel model,int distance) = _Visible;
  const factory RadarState.notVisible() = _NotVisible;
}
