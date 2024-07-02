import 'package:earthquake_map/models/earthquake.dart';
import 'package:earthquake_map/services/earthquake_sevice.dart';
import 'package:earthquake_map/views/quake_map/timer_panel_bottom_sheet.dart';
import 'package:earthquake_map/views/quake_map/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:earthquake_map/services/provider.dart';
import 'dart:async';

class QuakeMapPage extends ConsumerStatefulWidget {
  const QuakeMapPage({super.key});

  @override
  _QuakeMapPageState createState() => _QuakeMapPageState();
}

class _QuakeMapPageState extends ConsumerState<QuakeMapPage> {
  @override
  void initState() {
    super.initState();
    // 値が存在しない場合のみ実行
    if (EarthquakeData.earthquakes.isEmpty) {
      loadData();
    }
  }

  void loadData() async {
    await loadJsonAsset();
    // タイムシークシートの初期値を設定
    ref.read(markersProvider.notifier).set(EarthquakeData.earthquakes.last);
    ref
        .read(currentYearMonthProvider.notifier)
        .set(EarthquakeData.earthquakes.last[0].time);
    ref
        .read(currentYearMonthIndexProvider.notifier)
        .set(EarthquakeData.earthquakes.length - 1);
    ref
        .read(sliderMaxProvider.notifier)
        .set((EarthquakeData.earthquakes.length - 1).toDouble());
  }

  @override
  Widget build(BuildContext context) {
    final markers = ref.watch(markersProvider);
    void focusQuake(Earthquake quake) {
      // ボトムシート上段表示
      ref.read(focusEarthquakeProvider.notifier).set(quake);
      ref.read(isMaxHightBottomSheetProvider.notifier).set(true);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '地震ヒストリー',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
      ),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(35.6581, 137.309),
            initialZoom: 5.5,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  //標高タイル（基盤地図情報 数値標高モデル）'https://cyberjapandata.gsi.go.jp/xyz/hillshademap/{z}/{x}/{y}.png',
                  'https://cyberjapandata.gsi.go.jp/xyz/pale/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
                markers: markers
                    .map((quake) => QuakeMaker(quake, focusQuake))
                    .toList()),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  '国土地理院',
                  onTap: () => launchUrl(Uri.parse(
                      'https://maps.gsi.go.jp/development/ichiran.html')),
                ),
              ],
            ),
          ],
        ),
        UsageGuideBar(),
        TimerPanelBottomSheet()
      ]),
    );
  }
}
