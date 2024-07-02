import 'package:earthquake_map/models/earthquake.dart';
import 'package:earthquake_map/services/earthquake_sevice.dart';
import 'package:earthquake_map/views/quake_map/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:earthquake_map/services/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

// タイムシークシート
class TimerPanelBottomSheet extends ConsumerStatefulWidget {
  const TimerPanelBottomSheet({super.key});

  @override
  _TimerPanelBottomSheetState createState() => _TimerPanelBottomSheetState();
}

class _TimerPanelBottomSheetState extends ConsumerState<TimerPanelBottomSheet> {
  double _height = 120.0; // 初期の高さ
  final double _maxHeight = 300.0; // 最大の高さ

  void _updateHeight([bool? isMaxHeight]) {
    if (isMaxHeight == null) return;
    setState(() {
      // 上スワイプ
      if (isMaxHeight) {
        _height = _maxHeight;
      } else {
        // 下スワイプで元の位置にもどす
        _height = 120;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    ref.listen<bool>(isMaxHightBottomSheetProvider, (previous, next) {
      _updateHeight(next);
    });
    return Container(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -10) {
            ref.read(isMaxHightBottomSheetProvider.notifier).set(true);
          } else if (details.delta.dy > 10) {
            ref.read(isMaxHightBottomSheetProvider.notifier).set(false);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: _height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: const TimerPanel(),
          onEnd: () {},
        ),
      ),
    );
  }
}

class TimerPanel extends ConsumerStatefulWidget {
  const TimerPanel({super.key});

  @override
  _TimerPanelState createState() => _TimerPanelState();
}

class _TimerPanelState extends ConsumerState<TimerPanel> {
  Timer? _timer; // Timerオブジェクトを管理するための変数
  bool _isPlaying = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentYearMonth = ref.watch(currentYearMonthProvider);
    final currentYearMonthIndex = ref.watch(currentYearMonthIndexProvider);
    final sliderMax = ref.watch(sliderMaxProvider);
    final isMaxHeight = ref.watch(isMaxHightBottomSheetProvider);
    final focusEarthquake = ref.watch(focusEarthquakeProvider);

    void _toggleTimer() {
      // 動作中の場合、タイマーを止める
      if (_isPlaying) {
        _timer?.cancel();
        setState(() {
          _isPlaying = false;
        });
        return;
      }
      // 値が最後の場合、indexを0に戻してから開始する
      if (ref.read(currentYearMonthIndexProvider) == sliderMax) {
        ref.read(currentYearMonthIndexProvider.notifier).set(0);
        ref.read(currentYearMonthProvider.notifier).updateOnIndex(0);
      }

      _timer = Timer.periodic(Duration(seconds: 2), (timer) {
        // 最新年月になったらタイマーを止める
        if (ref.read(currentYearMonthIndexProvider) >= sliderMax) {
          timer.cancel();
          setState(() {
            _isPlaying = false;
          });
        } else {
          // 一ヶ月ごとに増やす
          ref.read(currentYearMonthIndexProvider.notifier).increment();
          ref
              .read(currentYearMonthProvider.notifier)
              .updateOnIndex(ref.read(currentYearMonthIndexProvider));
          ref
              .read(markersProvider.notifier)
              .updateOnIndex(ref.read(currentYearMonthIndexProvider));

          setState(() {
            _isPlaying = true;
          });
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4).h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(32.0).w,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 4.h),
              Text(currentYearMonth),
              SizedBox(height: 8.h),
              isMaxHeight && focusEarthquake != null
                  ? EarthquakeInfoBox(focusEarthquake: focusEarthquake)
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10).w,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                icon: playIcon(),
                                onPressed: _toggleTimer,
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Slider(
                                        value: currentYearMonthIndex.toDouble(),
                                        max: sliderMax,
                                        onChanged: (double value) {
                                          setState(() {
                                            ref
                                                .read(
                                                    currentYearMonthIndexProvider
                                                        .notifier)
                                                .set(value.toInt());
                                            ref
                                                .read(currentYearMonthProvider
                                                    .notifier)
                                                .updateOnIndex(value.toInt());
                                            ref
                                                .read(markersProvider.notifier)
                                                .updateOnIndex(value.toInt());

                                            _timer?.cancel();
                                            _isPlaying = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                            horizontal: 15)
                                        .w,
                                    child: Container(
                                      height: 40.h,
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('2023.5',
                                              style:
                                                  TextStyle(fontSize: 10.sp)),
                                          Text('2023.6',
                                              style:
                                                  TextStyle(fontSize: 10.sp)),
                                          Text('2023.7',
                                              style:
                                                  TextStyle(fontSize: 10.sp)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Icon playIcon() => _isPlaying
      ? const Icon(Icons.pause_circle, size: 30)
      : const Icon(
          Icons.play_circle,
          size: 30,
        );
}
