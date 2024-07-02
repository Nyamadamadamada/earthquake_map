import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

import 'package:earthquake_map/models/earthquake.dart';

class EarthquakeData {
  static DateTime? firstDate;
  static DateTime? lastDate;
  static List<List<Earthquake>> earthquakes = [];
}

// 地震データを読み込み、EarthquakeDataへ保管
Future<void> loadJsonAsset() async {
  try {
    String contents =
        await rootBundle.loadString('assets/earthquake_data.json');
    var jsonData = json.decode(contents);
    var data = jsonData["data"];
    List<List<Earthquake>> monthGroupEarthquakes = [];

    // 年月でグループ化された地震情報を格納
    for (List earthquakesJson in data) {
      List<Earthquake> earthquakes = earthquakesJson.map((item) {
        Map<String, Object?> earthquakeJson = {
          "id": item["id"],
          "depth": item["earthquake"]["depth"],
          "latitude": item["earthquake"]["latitude"],
          "longitude": item["earthquake"]["longitude"],
          "magnitude": item["earthquake"]["magnitude"],
          "place": item["earthquake"]["name"],
          "maxScale": item["maxScale"],
          "time": item["time"],
        };
        return Earthquake.fromJson(earthquakeJson);
      }).toList();
      monthGroupEarthquakes.add(earthquakes);
    }

    EarthquakeData.earthquakes = monthGroupEarthquakes;
    EarthquakeData.firstDate = DateTime.parse(jsonData["first_date"]);
    EarthquakeData.lastDate = DateTime.parse(jsonData["last_date"]);
  } catch (e) {
    print('Error loading JSON data: $e');
  }
}

// マグニチュードごとにマーカーの色を変える
Color getColorByMagnitude(double magnitude) {
  if (magnitude >= 7) {
    return Colors.red[800] ?? Colors.red;
  }
  if (magnitude >= 6) {
    return Colors.orange[800] ?? Colors.orange;
  }
  if (magnitude >= 5) {
    return Colors.yellow[600] ?? Colors.yellow;
  }
  if (magnitude >= 4) {
    return Colors.green[800] ?? Colors.green;
  }
  if (magnitude >= 3) {
    return Colors.lightGreen;
  }
  return Colors.grey;
}
