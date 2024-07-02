import 'package:earthquake_map/views/home/home_page.dart';
import 'package:earthquake_map/views/quake_map/quake_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  // 日時の日本語対応
  initializeDateFormatting('ja_JP').then((_) {
    runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '地震ヒストリーマップ',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              background: Colors.white,
            ),
            // スライダーのテーマ指定
            sliderTheme: SliderThemeData(
              trackHeight: 2.h,
              thumbColor: Colors.white,
              overlayColor: Colors.green.withAlpha(80),
            ),
            primaryColor: Colors.red[800],
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: QuakeMapPage(),
    );
  }
}
