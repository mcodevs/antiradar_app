// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RadarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model, int distance) visible,
    required TResult Function() notVisible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model, int distance)? visible,
    TResult? Function()? notVisible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model, int distance)? visible,
    TResult Function()? notVisible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Visible value) visible,
    required TResult Function(_NotVisible value) notVisible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Visible value)? visible,
    TResult? Function(_NotVisible value)? notVisible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Visible value)? visible,
    TResult Function(_NotVisible value)? notVisible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadarStateCopyWith<$Res> {
  factory $RadarStateCopyWith(
          RadarState value, $Res Function(RadarState) then) =
      _$RadarStateCopyWithImpl<$Res, RadarState>;
}

/// @nodoc
class _$RadarStateCopyWithImpl<$Res, $Val extends RadarState>
    implements $RadarStateCopyWith<$Res> {
  _$RadarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VisibleImplCopyWith<$Res> {
  factory _$$VisibleImplCopyWith(
          _$VisibleImpl value, $Res Function(_$VisibleImpl) then) =
      __$$VisibleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RadarModel model, int distance});
}

/// @nodoc
class __$$VisibleImplCopyWithImpl<$Res>
    extends _$RadarStateCopyWithImpl<$Res, _$VisibleImpl>
    implements _$$VisibleImplCopyWith<$Res> {
  __$$VisibleImplCopyWithImpl(
      _$VisibleImpl _value, $Res Function(_$VisibleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? distance = null,
  }) {
    return _then(_$VisibleImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RadarModel,
      null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VisibleImpl implements _Visible {
  const _$VisibleImpl(this.model, this.distance);

  @override
  final RadarModel model;
  @override
  final int distance;

  @override
  String toString() {
    return 'RadarState.visible(model: $model, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisibleImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisibleImplCopyWith<_$VisibleImpl> get copyWith =>
      __$$VisibleImplCopyWithImpl<_$VisibleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model, int distance) visible,
    required TResult Function() notVisible,
  }) {
    return visible(model, distance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model, int distance)? visible,
    TResult? Function()? notVisible,
  }) {
    return visible?.call(model, distance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model, int distance)? visible,
    TResult Function()? notVisible,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(model, distance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Visible value) visible,
    required TResult Function(_NotVisible value) notVisible,
  }) {
    return visible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Visible value)? visible,
    TResult? Function(_NotVisible value)? notVisible,
  }) {
    return visible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Visible value)? visible,
    TResult Function(_NotVisible value)? notVisible,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(this);
    }
    return orElse();
  }
}

abstract class _Visible implements RadarState {
  const factory _Visible(final RadarModel model, final int distance) =
      _$VisibleImpl;

  RadarModel get model;
  int get distance;
  @JsonKey(ignore: true)
  _$$VisibleImplCopyWith<_$VisibleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotVisibleImplCopyWith<$Res> {
  factory _$$NotVisibleImplCopyWith(
          _$NotVisibleImpl value, $Res Function(_$NotVisibleImpl) then) =
      __$$NotVisibleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotVisibleImplCopyWithImpl<$Res>
    extends _$RadarStateCopyWithImpl<$Res, _$NotVisibleImpl>
    implements _$$NotVisibleImplCopyWith<$Res> {
  __$$NotVisibleImplCopyWithImpl(
      _$NotVisibleImpl _value, $Res Function(_$NotVisibleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotVisibleImpl implements _NotVisible {
  const _$NotVisibleImpl();

  @override
  String toString() {
    return 'RadarState.notVisible()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotVisibleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RadarModel model, int distance) visible,
    required TResult Function() notVisible,
  }) {
    return notVisible();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RadarModel model, int distance)? visible,
    TResult? Function()? notVisible,
  }) {
    return notVisible?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RadarModel model, int distance)? visible,
    TResult Function()? notVisible,
    required TResult orElse(),
  }) {
    if (notVisible != null) {
      return notVisible();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Visible value) visible,
    required TResult Function(_NotVisible value) notVisible,
  }) {
    return notVisible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Visible value)? visible,
    TResult? Function(_NotVisible value)? notVisible,
  }) {
    return notVisible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Visible value)? visible,
    TResult Function(_NotVisible value)? notVisible,
    required TResult orElse(),
  }) {
    if (notVisible != null) {
      return notVisible(this);
    }
    return orElse();
  }
}

abstract class _NotVisible implements RadarState {
  const factory _NotVisible() = _$NotVisibleImpl;
}
