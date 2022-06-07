import 'package:flutter/material.dart';
import 'package:my_app/screen/home_screen.dart';
import 'package:my_app/screen/business_card.dart';
import 'package:my_app/screen/building_layouts.dart';
// project_name/lib 경로를 기준으로 설정한다.

void main() {
  runApp(
    // runApp 다음에는 항상 MaterialApp 이 들어가야 한다.
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuildingLayouts(),
    ),
  );
}
