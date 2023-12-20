part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.addRadar(RadarModel model) = _AddRadar;
  const factory MapEvent.removeRadar(RadarModel model) = _RemoveRadar;
  const factory MapEvent.updateRadar(RadarModel model) = _UpdateRadar;
  const factory MapEvent.tapRadar(RadarModel model) = _TapRadar;
  const factory MapEvent.radiusRadar(int radius) = _RadiusRadar;
}
