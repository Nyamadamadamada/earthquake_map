import 'package:earthquake_map/models/earthquake.dart';
import 'package:earthquake_map/services/earthquake_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// タイムシークシートの年月
class CurrentYearMonthNotifier extends StateNotifier<String> {
  CurrentYearMonthNotifier() : super("");

  void set(DateTime dt) {
    state = DateFormat('yyyy年 MM月', "ja_JP").format(dt);
  }

  void updateOnIndex(int index) {
    DateTime dt = EarthquakeData.earthquakes[index][0].time;
    state = DateFormat('yyyy年 MM月', "ja_JP").format(dt);
  }
}

final currentYearMonthProvider =
    StateNotifierProvider<CurrentYearMonthNotifier, String>((ref) {
  return CurrentYearMonthNotifier();
});

// タイムシークの最大値
class SliderMaxNotifier extends StateNotifier<double> {
  SliderMaxNotifier() : super(0.0);

  void set(double maxValue) {
    state = maxValue;
  }
}

final sliderMaxProvider =
    StateNotifierProvider<SliderMaxNotifier, double>((ref) {
  return SliderMaxNotifier();
});

// タイムシークの現在の値（インデックス）
class CurrentYearMonthIndexNotifier extends StateNotifier<int> {
  CurrentYearMonthIndexNotifier() : super(0);

  void set(int index) {
    state = index;
  }

  void increment() {
    state = state + 1;
  }
}

final currentYearMonthIndexProvider =
    StateNotifierProvider<CurrentYearMonthIndexNotifier, int>((ref) {
  return CurrentYearMonthIndexNotifier();
});

// 地震マーカー配列
class MarkersNotifier extends StateNotifier<List<Earthquake>> {
  MarkersNotifier() : super([]);

  void set(List<Earthquake> list) {
    state = list;
  }

  void updateOnIndex(int index) {
    List<Earthquake> list = EarthquakeData.earthquakes[index];
    state = list;
  }
}

final markersProvider =
    StateNotifierProvider<MarkersNotifier, List<Earthquake>>((ref) {
  return MarkersNotifier();
});

// タムシークボトムシートの高さが高いかフラグ
class IsMaxHightBottomSheetNotifier extends StateNotifier<bool> {
  IsMaxHightBottomSheetNotifier() : super(false);

  void set(bool isMaxHight) {
    state = isMaxHight;
  }
}

final isMaxHightBottomSheetProvider =
    StateNotifierProvider<IsMaxHightBottomSheetNotifier, bool>((ref) {
  return IsMaxHightBottomSheetNotifier();
});

// 選択された地震情報
class FocusEarthquakeNotifier extends StateNotifier<Earthquake?> {
  FocusEarthquakeNotifier() : super(null);

  void set(Earthquake quake) {
    state = quake;
  }

  void setEmpty() {
    state = null;
  }
}

final focusEarthquakeProvider =
    StateNotifierProvider<FocusEarthquakeNotifier, Earthquake?>((ref) {
  return FocusEarthquakeNotifier();
});
