// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res, MapEvent>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res, $Val extends MapEvent>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddRadarImplCopyWith<$Res> {
  factory _$$AddRadarImplCopyWith(
          _$AddRadarImpl value, $Res Function(_$AddRadarImpl) then) =
      __$$AddRadarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model});
}

/// @nodoc
class __$$AddRadarImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$AddRadarImpl>
    implements _$$AddRadarImplCopyWith<$Res> {
  __$$AddRadarImplCopyWithImpl(
      _$AddRadarImpl _value, $Res Function(_$AddRadarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$AddRadarImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
    ));
  }
}

/// @nodoc

class _$AddRadarImpl implements _AddRadar {
  const _$AddRadarImpl(this.model);

  @override
  final RadarModel model;

  @override
  String toString() {
    return 'MapEvent.addRadar(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRadarImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRadarImplCopyWith<_$AddRadarImpl> get copyWith =>
      __$$AddRadarImplCopyWithImpl<_$AddRadarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) {
    return addRadar(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) {
    return addRadar?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) {
    if (addRadar != null) {
      return addRadar(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) {
    return addRadar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) {
    return addRadar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) {
    if (addRadar != null) {
      return addRadar(this);
    }
    return orElse();
  }
}

abstract class _AddRadar implements MapEvent {
  const factory _AddRadar(final RadarModel model) = _$AddRadarImpl;

  RadarModel get model;
  @JsonKey(ignore: true)
  _$$AddRadarImplCopyWith<_$AddRadarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveRadarImplCopyWith<$Res> {
  factory _$$RemoveRadarImplCopyWith(
          _$RemoveRadarImpl value, $Res Function(_$RemoveRadarImpl) then) =
      __$$RemoveRadarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model});
}

/// @nodoc
class __$$RemoveRadarImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$RemoveRadarImpl>
    implements _$$RemoveRadarImplCopyWith<$Res> {
  __$$RemoveRadarImplCopyWithImpl(
      _$RemoveRadarImpl _value, $Res Function(_$RemoveRadarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$RemoveRadarImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
    ));
  }
}

/// @nodoc

class _$RemoveRadarImpl implements _RemoveRadar {
  const _$RemoveRadarImpl(this.model);

  @override
  final RadarModel model;

  @override
  String toString() {
    return 'MapEvent.removeRadar(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveRadarImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveRadarImplCopyWith<_$RemoveRadarImpl> get copyWith =>
      __$$RemoveRadarImplCopyWithImpl<_$RemoveRadarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) {
    return removeRadar(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) {
    return removeRadar?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) {
    if (removeRadar != null) {
      return removeRadar(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) {
    return removeRadar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) {
    return removeRadar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) {
    if (removeRadar != null) {
      return removeRadar(this);
    }
    return orElse();
  }
}

abstract class _RemoveRadar implements MapEvent {
  const factory _RemoveRadar(final RadarModel model) = _$RemoveRadarImpl;

  RadarModel get model;
  @JsonKey(ignore: true)
  _$$RemoveRadarImplCopyWith<_$RemoveRadarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRadarImplCopyWith<$Res> {
  factory _$$UpdateRadarImplCopyWith(
          _$UpdateRadarImpl value, $Res Function(_$UpdateRadarImpl) then) =
      __$$UpdateRadarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model});
}

/// @nodoc
class __$$UpdateRadarImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$UpdateRadarImpl>
    implements _$$UpdateRadarImplCopyWith<$Res> {
  __$$UpdateRadarImplCopyWithImpl(
      _$UpdateRadarImpl _value, $Res Function(_$UpdateRadarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$UpdateRadarImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
    ));
  }
}

/// @nodoc

class _$UpdateRadarImpl implements _UpdateRadar {
  const _$UpdateRadarImpl(this.model);

  @override
  final RadarModel model;

  @override
  String toString() {
    return 'MapEvent.updateRadar(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRadarImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRadarImplCopyWith<_$UpdateRadarImpl> get copyWith =>
      __$$UpdateRadarImplCopyWithImpl<_$UpdateRadarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) {
    return updateRadar(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) {
    return updateRadar?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) {
    if (updateRadar != null) {
      return updateRadar(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) {
    return updateRadar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) {
    return updateRadar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) {
    if (updateRadar != null) {
      return updateRadar(this);
    }
    return orElse();
  }
}

abstract class _UpdateRadar implements MapEvent {
  const factory _UpdateRadar(final RadarModel model) = _$UpdateRadarImpl;

  RadarModel get model;
  @JsonKey(ignore: true)
  _$$UpdateRadarImplCopyWith<_$UpdateRadarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TapRadarImplCopyWith<$Res> {
  factory _$$TapRadarImplCopyWith(
          _$TapRadarImpl value, $Res Function(_$TapRadarImpl) then) =
      __$$TapRadarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model});
}

/// @nodoc
class __$$TapRadarImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$TapRadarImpl>
    implements _$$TapRadarImplCopyWith<$Res> {
  __$$TapRadarImplCopyWithImpl(
      _$TapRadarImpl _value, $Res Function(_$TapRadarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$TapRadarImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
    ));
  }
}

/// @nodoc

class _$TapRadarImpl implements _TapRadar {
  const _$TapRadarImpl(this.model);

  @override
  final RadarModel model;

  @override
  String toString() {
    return 'MapEvent.tapRadar(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TapRadarImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TapRadarImplCopyWith<_$TapRadarImpl> get copyWith =>
      __$$TapRadarImplCopyWithImpl<_$TapRadarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) {
    return tapRadar(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) {
    return tapRadar?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) {
    if (tapRadar != null) {
      return tapRadar(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) {
    return tapRadar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) {
    return tapRadar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) {
    if (tapRadar != null) {
      return tapRadar(this);
    }
    return orElse();
  }
}

abstract class _TapRadar implements MapEvent {
  const factory _TapRadar(final RadarModel model) = _$TapRadarImpl;

  RadarModel get model;
  @JsonKey(ignore: true)
  _$$TapRadarImplCopyWith<_$TapRadarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadiusRadarImplCopyWith<$Res> {
  factory _$$RadiusRadarImplCopyWith(
          _$RadiusRadarImpl value, $Res Function(_$RadiusRadarImpl) then) =
      __$$RadiusRadarImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int radius});
}

/// @nodoc
class __$$RadiusRadarImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$RadiusRadarImpl>
    implements _$$RadiusRadarImplCopyWith<$Res> {
  __$$RadiusRadarImplCopyWithImpl(
      _$RadiusRadarImpl _value, $Res Function(_$RadiusRadarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
  }) {
    return _then(_$RadiusRadarImpl(
      null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RadiusRadarImpl implements _RadiusRadar {
  const _$RadiusRadarImpl(this.radius);

  @override
  final int radius;

  @override
  String toString() {
    return 'MapEvent.radiusRadar(radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadiusRadarImpl &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadiusRadarImplCopyWith<_$RadiusRadarImpl> get copyWith =>
      __$$RadiusRadarImplCopyWithImpl<_$RadiusRadarImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model) addRadar,
    required TResult Function(RadarModel model) removeRadar,
    required TResult Function(RadarModel model) updateRadar,
    required TResult Function(RadarModel model) tapRadar,
    required TResult Function(int radius) radiusRadar,
  }) {
    return radiusRadar(radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model)? addRadar,
    TResult? Function(RadarModel model)? removeRadar,
    TResult? Function(RadarModel model)? updateRadar,
    TResult? Function(RadarModel model)? tapRadar,
    TResult? Function(int radius)? radiusRadar,
  }) {
    return radiusRadar?.call(radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model)? addRadar,
    TResult Function(RadarModel model)? removeRadar,
    TResult Function(RadarModel model)? updateRadar,
    TResult Function(RadarModel model)? tapRadar,
    TResult Function(int radius)? radiusRadar,
    required TResult orElse(),
  }) {
    if (radiusRadar != null) {
      return radiusRadar(radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddRadar value) addRadar,
    required TResult Function(_RemoveRadar value) removeRadar,
    required TResult Function(_UpdateRadar value) updateRadar,
    required TResult Function(_TapRadar value) tapRadar,
    required TResult Function(_RadiusRadar value) radiusRadar,
  }) {
    return radiusRadar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddRadar value)? addRadar,
    TResult? Function(_RemoveRadar value)? removeRadar,
    TResult? Function(_UpdateRadar value)? updateRadar,
    TResult? Function(_TapRadar value)? tapRadar,
    TResult? Function(_RadiusRadar value)? radiusRadar,
  }) {
    return radiusRadar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddRadar value)? addRadar,
    TResult Function(_RemoveRadar value)? removeRadar,
    TResult Function(_UpdateRadar value)? updateRadar,
    TResult Function(_TapRadar value)? tapRadar,
    TResult Function(_RadiusRadar value)? radiusRadar,
    required TResult orElse(),
  }) {
    if (radiusRadar != null) {
      return radiusRadar(this);
    }
    return orElse();
  }
}

abstract class _RadiusRadar implements MapEvent {
  const factory _RadiusRadar(final int radius) = _$RadiusRadarImpl;

  int get radius;
  @JsonKey(ignore: true)
  _$$RadiusRadarImplCopyWith<_$RadiusRadarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Set<Marker> markers) success,
    required TResult Function(RadarModel model) radarTapped,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Set<Marker> markers)? success,
    TResult? Function(RadarModel model)? radarTapped,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Set<Marker> markers)? success,
    TResult Function(RadarModel model)? radarTapped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_RadarTapped value) radarTapped,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_RadarTapped value)? radarTapped,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_RadarTapped value)? radarTapped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MapState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Set<Marker> markers) success,
    required TResult Function(RadarModel model) radarTapped,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Set<Marker> markers)? success,
    TResult? Function(RadarModel model)? radarTapped,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Set<Marker> markers)? success,
    TResult Function(RadarModel model)? radarTapped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_RadarTapped value) radarTapped,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_RadarTapped value)? radarTapped,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_RadarTapped value)? radarTapped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MapState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Set<Marker> markers});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
  }) {
    return _then(_$SuccessImpl(
      null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final Set<Marker> markers) : _markers = markers;

  final Set<Marker> _markers;
  @override
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  String toString() {
    return 'MapState.success(markers: $markers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Set<Marker> markers) success,
    required TResult Function(RadarModel model) radarTapped,
    required TResult Function(String message) error,
  }) {
    return success(markers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Set<Marker> markers)? success,
    TResult? Function(RadarModel model)? radarTapped,
    TResult? Function(String message)? error,
  }) {
    return success?.call(markers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Set<Marker> markers)? success,
    TResult Function(RadarModel model)? radarTapped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(markers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_RadarTapped value) radarTapped,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_RadarTapped value)? radarTapped,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_RadarTapped value)? radarTapped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MapState {
  const factory _Success(final Set<Marker> markers) = _$SuccessImpl;

  Set<Marker> get markers;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadarTappedImplCopyWith<$Res> {
  factory _$$RadarTappedImplCopyWith(
          _$RadarTappedImpl value, $Res Function(_$RadarTappedImpl) then) =
      __$$RadarTappedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model});
}

/// @nodoc
class __$$RadarTappedImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$RadarTappedImpl>
    implements _$$RadarTappedImplCopyWith<$Res> {
  __$$RadarTappedImplCopyWithImpl(
      _$RadarTappedImpl _value, $Res Function(_$RadarTappedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$RadarTappedImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
    ));
  }
}

/// @nodoc

class _$RadarTappedImpl implements _RadarTapped {
  const _$RadarTappedImpl(this.model);

  @override
  final RadarModel model;

  @override
  String toString() {
    return 'MapState.radarTapped(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadarTappedImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadarTappedImplCopyWith<_$RadarTappedImpl> get copyWith =>
      __$$RadarTappedImplCopyWithImpl<_$RadarTappedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Set<Marker> markers) success,
    required TResult Function(RadarModel model) radarTapped,
    required TResult Function(String message) error,
  }) {
    return radarTapped(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Set<Marker> markers)? success,
    TResult? Function(RadarModel model)? radarTapped,
    TResult? Function(String message)? error,
  }) {
    return radarTapped?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Set<Marker> markers)? success,
    TResult Function(RadarModel model)? radarTapped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (radarTapped != null) {
      return radarTapped(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_RadarTapped value) radarTapped,
    required TResult Function(_Error value) error,
  }) {
    return radarTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_RadarTapped value)? radarTapped,
    TResult? Function(_Error value)? error,
  }) {
    return radarTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_RadarTapped value)? radarTapped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (radarTapped != null) {
      return radarTapped(this);
    }
    return orElse();
  }
}

abstract class _RadarTapped implements MapState {
  const factory _RadarTapped(final RadarModel model) = _$RadarTappedImpl;

  RadarModel get model;
  @JsonKey(ignore: true)
  _$$RadarTappedImplCopyWith<_$RadarTappedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MapState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Set<Marker> markers) success,
    required TResult Function(RadarModel model) radarTapped,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Set<Marker> markers)? success,
    TResult? Function(RadarModel model)? radarTapped,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Set<Marker> markers)? success,
    TResult Function(RadarModel model)? radarTapped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_RadarTapped value) radarTapped,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_RadarTapped value)? radarTapped,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_RadarTapped value)? radarTapped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MapState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
