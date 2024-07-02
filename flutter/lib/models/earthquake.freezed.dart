// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earthquake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Earthquake _$EarthquakeFromJson(Map<String, dynamic> json) {
  return _Earthquake.fromJson(json);
}

/// @nodoc
mixin _$Earthquake {
  String get id => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get magnitude => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  int get maxScale => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarthquakeCopyWith<Earthquake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarthquakeCopyWith<$Res> {
  factory $EarthquakeCopyWith(
          Earthquake value, $Res Function(Earthquake) then) =
      _$EarthquakeCopyWithImpl<$Res, Earthquake>;
  @useResult
  $Res call(
      {String id,
      int depth,
      double latitude,
      double longitude,
      double magnitude,
      String place,
      int maxScale,
      @DateTimeConverter() DateTime time});
}

/// @nodoc
class _$EarthquakeCopyWithImpl<$Res, $Val extends Earthquake>
    implements $EarthquakeCopyWith<$Res> {
  _$EarthquakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depth = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? magnitude = null,
    Object? place = null,
    Object? maxScale = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      magnitude: null == magnitude
          ? _value.magnitude
          : magnitude // ignore: cast_nullable_to_non_nullable
              as double,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      maxScale: null == maxScale
          ? _value.maxScale
          : maxScale // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EarthquakeImplCopyWith<$Res>
    implements $EarthquakeCopyWith<$Res> {
  factory _$$EarthquakeImplCopyWith(
          _$EarthquakeImpl value, $Res Function(_$EarthquakeImpl) then) =
      __$$EarthquakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int depth,
      double latitude,
      double longitude,
      double magnitude,
      String place,
      int maxScale,
      @DateTimeConverter() DateTime time});
}

/// @nodoc
class __$$EarthquakeImplCopyWithImpl<$Res>
    extends _$EarthquakeCopyWithImpl<$Res, _$EarthquakeImpl>
    implements _$$EarthquakeImplCopyWith<$Res> {
  __$$EarthquakeImplCopyWithImpl(
      _$EarthquakeImpl _value, $Res Function(_$EarthquakeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depth = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? magnitude = null,
    Object? place = null,
    Object? maxScale = null,
    Object? time = null,
  }) {
    return _then(_$EarthquakeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      magnitude: null == magnitude
          ? _value.magnitude
          : magnitude // ignore: cast_nullable_to_non_nullable
              as double,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      maxScale: null == maxScale
          ? _value.maxScale
          : maxScale // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EarthquakeImpl with DiagnosticableTreeMixin implements _Earthquake {
  const _$EarthquakeImpl(
      {required this.id,
      required this.depth,
      required this.latitude,
      required this.longitude,
      required this.magnitude,
      required this.place,
      required this.maxScale,
      @DateTimeConverter() required this.time});

  factory _$EarthquakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarthquakeImplFromJson(json);

  @override
  final String id;
  @override
  final int depth;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double magnitude;
  @override
  final String place;
  @override
  final int maxScale;
  @override
  @DateTimeConverter()
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Earthquake(id: $id, depth: $depth, latitude: $latitude, longitude: $longitude, magnitude: $magnitude, place: $place, maxScale: $maxScale, time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Earthquake'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('depth', depth))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('magnitude', magnitude))
      ..add(DiagnosticsProperty('place', place))
      ..add(DiagnosticsProperty('maxScale', maxScale))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarthquakeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.magnitude, magnitude) ||
                other.magnitude == magnitude) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.maxScale, maxScale) ||
                other.maxScale == maxScale) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, depth, latitude, longitude,
      magnitude, place, maxScale, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EarthquakeImplCopyWith<_$EarthquakeImpl> get copyWith =>
      __$$EarthquakeImplCopyWithImpl<_$EarthquakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EarthquakeImplToJson(
      this,
    );
  }
}

abstract class _Earthquake implements Earthquake {
  const factory _Earthquake(
      {required final String id,
      required final int depth,
      required final double latitude,
      required final double longitude,
      required final double magnitude,
      required final String place,
      required final int maxScale,
      @DateTimeConverter() required final DateTime time}) = _$EarthquakeImpl;

  factory _Earthquake.fromJson(Map<String, dynamic> json) =
      _$EarthquakeImpl.fromJson;

  @override
  String get id;
  @override
  int get depth;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get magnitude;
  @override
  String get place;
  @override
  int get maxScale;
  @override
  @DateTimeConverter()
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$EarthquakeImplCopyWith<_$EarthquakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
