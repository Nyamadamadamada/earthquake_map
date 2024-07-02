import 'package:earthquake_map/views/quake_map/quake_map_page.dart';
import 'package:earthquake_map/views/quake_map/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '地震',
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), //角丸
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2)),
              icon: const Icon(Icons.map),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QuakeMapPage(),
                  ),
                );
              },
              label: Text(
                '地震ヒストリー',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: Center(
          child: Column(
        children: [
          const Expanded(
            child: Text("ttt"),
          ),
        ],
      )),
    );
  }
}
