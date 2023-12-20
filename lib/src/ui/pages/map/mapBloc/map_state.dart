part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.loading() = _Loading;
  const factory MapState.success(Set<Marker> markers) = _Success;
  const factory MapState.radarTapped(RadarModel radar, Set<Marker> markers) = _RadarTapped;
  const factory MapState.error(String message) = _Error;
}
