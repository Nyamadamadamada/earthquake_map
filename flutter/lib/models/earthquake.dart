import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import "package:intl/intl.dart";

part 'earthquake.freezed.dart';
part 'earthquake.g.dart';

@freezed
class Earthquake with _$Earthquake {
  const factory Earthquake({
    required String id,
    required int depth,
    required double latitude,
    required double longitude,
    required double magnitude,
    required String place,
    required int maxScale,
    @DateTimeConverter() required DateTime time,
  }) = _Earthquake;

  factory Earthquake.fromJson(Map<String, Object?> json) =>
      _$EarthquakeFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    try {
      return DateTime.parse(json);
    } catch (e) {
      // 不正な形式の場合のエラーハンドリング
      print('Failed to parse DateTime: $json, Error: $e');
      throw FormatException('Invalid DateTime format', json);
    }
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
