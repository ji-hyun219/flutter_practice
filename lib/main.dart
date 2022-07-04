import 'package:flutter/material.dart';
// import 'package:my_app/pages/home_screen.dart';
// import 'package:my_app/pages/business_card.dart';
// import 'package:my_app/pages/building_layouts.dart';
// import 'package:my_app/pages/tapboxA.dart';
// // import 'package:my_app/pages/tapboxB.dart';
// import 'package:my_app/pages/tapboxC.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/srt_staking.dart';

// project_name/lib 경로를 기준으로 설정한다.

void main() {
  runApp(
    // runApp 다음에는 항상 MaterialApp 이 들어가야 한다.
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SrtStaking(),
    ),
  );
  // loadAddress();
  // loadProduct();
  // loadPage();
}
