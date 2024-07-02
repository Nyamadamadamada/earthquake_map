import 'package:earthquake_map/models/earthquake.dart';
import 'package:earthquake_map/services/earthquake_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:earthquake_map/services/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class UsageGuideColumn extends StatelessWidget {
  final Color color;
  final String text;
  final bool hasLeftBorder;

  const UsageGuideColumn({
    super.key,
    required this.color,
    required this.text,
    this.hasLeftBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: color,
            border: Border(
              top: BorderSide(color: Colors.grey[700] ?? Colors.grey, width: 1),
              right:
                  BorderSide(color: Colors.grey[700] ?? Colors.grey, width: 1),
              left: BorderSide(
                  color: hasLeftBorder
                      ? Colors.grey[700] ?? Colors.grey
                      : Colors.transparent,
                  width: 1),
              bottom:
                  BorderSide(color: Colors.grey[700] ?? Colors.grey, width: 1),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 8.sp, color: Colors.grey[800]),
        ),
      ],
    );
  }
}

class UsageGuide extends StatelessWidget {
  const UsageGuide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UsageGuideColumn(
          color: Colors.lightGreen,
          text: "3",
          hasLeftBorder: true,
        ),
        UsageGuideColumn(
          color: Colors.green[800] ?? Colors.green,
          text: "4",
        ),
        UsageGuideColumn(
          color: Colors.yellow[600] ?? Colors.yellow,
          text: "5",
        ),
        UsageGuideColumn(
          color: Colors.orange[800] ?? Colors.orange,
          text: "6",
        ),
        UsageGuideColumn(
          color: Colors.red[800] ?? Colors.red,
          text: "7",
        ),
      ],
    );
  }
}

class UsageGuideBar extends StatelessWidget {
  const UsageGuideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0.5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "マグニチュード",
                  style: TextStyle(
                      fontSize: 10.sp,
                      letterSpacing: -1.sp,
                      color: Colors.grey[800]),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 2).h,
                child: const UsageGuide(),
              ), // 凡例
            ],
          ),
        ),
      ],
    );
  }
}

Marker QuakeMaker(Earthquake quake, Function focusQuake) {
  return Marker(
    width: 80.0,
    height: 80.0,
    // ピンの位置を設定
    point: LatLng(quake.latitude, quake.longitude),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getColorByMagnitude(quake.magnitude),
          ),
        )
            .animate(onPlay: (controller) => controller.repeat())
            .scale(
              delay: 400.ms,
              duration: 1600.ms,
            )
            .fadeOut(duration: 1400.ms),
        GestureDetector(
          onTap: () => {focusQuake(quake)},
          child: Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColorByMagnitude(quake.magnitude),
            ),
          ),
        )
      ],
    ),
    rotate: true, // ピンは常に同じ向き,
  );
}

class EarthquakeInfoBox extends StatefulWidget {
  const EarthquakeInfoBox({
    super.key,
    required this.focusEarthquake,
  });

  final Earthquake focusEarthquake;

  @override
  State<EarthquakeInfoBox> createState() => _EarthquakeInfoBoxState();
}

class _EarthquakeInfoBoxState extends State<EarthquakeInfoBox> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14).w,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // タイトル
                        Text(
                          widget.focusEarthquake.place,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 2.h,
                        ),
                        // 説明文
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            Text('震源地までの深さ: ${widget.focusEarthquake.depth} km',
                                style: TextStyle(fontSize: 12.sp)),
                            SizedBox(height: 8.h),
                            Text('マグニチュード: ${widget.focusEarthquake.magnitude}',
                                style: TextStyle(fontSize: 12.sp)),
                            SizedBox(height: 8.h),
                            Text(
                                '最大震度: ${widget.focusEarthquake.maxScale.toString().substring(0, 1)}',
                                style: TextStyle(fontSize: 12.sp)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          )
        : const SizedBox();
  }
}
