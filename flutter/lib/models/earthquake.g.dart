// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EarthquakeImpl _$$EarthquakeImplFromJson(Map<String, dynamic> json) =>
    _$EarthquakeImpl(
      id: json['id'] as String,
      depth: (json['depth'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      magnitude: (json['magnitude'] as num).toDouble(),
      place: json['place'] as String,
      maxScale: (json['maxScale'] as num).toInt(),
      time: const DateTimeConverter().fromJson(json['time'] as String),
    );

Map<String, dynamic> _$$EarthquakeImplToJson(_$EarthquakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depth': instance.depth,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'magnitude': instance.magnitude,
      'place': instance.place,
      'maxScale': instance.maxScale,
      'time': const DateTimeConverter().toJson(instance.time),
    };
