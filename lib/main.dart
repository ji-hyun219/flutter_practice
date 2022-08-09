import 'package:flutter/material.dart';
// import 'package:my_app/pages/home_screen.dart';
// import 'package:my_app/pages/business_card.dart';
// import 'package:my_app/pages/building_layouts.dart';
// import 'package:my_app/pages/tapboxA.dart';
// // import 'package:my_app/pages/tapboxB.dart';
// import 'package:my_app/pages/tapboxC.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/make_dummy_data.dart';
import 'package:my_app/pages/stream_builder_test/todo_list.dart';
// import 'package:my_app/pages/slider.dart';
// import 'package:my_app/pages/todo_list.dart';
// import 'package:my_app/pages/get_to_result2.dart';
// import 'package:my_app/pages/lottie.dart';
// import 'package:my_app/pages/dynamic_link.dart';
// import 'package:my_app/pages/srt_staking.dart';

// project_name/lib 경로를 기준으로 설정한다.

void main() {
  runApp(
    // runApp 다음에는 항상 MaterialApp 이 들어가야 한다.
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SrtStaking(),
      // home: DynamicLink(),
      // home: PurchaseWidget(),
      // home: TodoList(),
      // home: SliderPage()),
      // home: StreamBuilderPage()),
      // home: AspectRatioPage()),
      // home: RegisterPage()),
      // home: ListGenerate(
      //   items: List<ListItem>.generate(
      //     1000,
      //     (i) => i % 6 == 0
      //         ? HeadingItem('Heading $i')
      //         : MessageItem('Sender $i', 'Message body $i'),
      //   ),
      // ),
      // home: DropDownPage(),
      // home: TabBarPage()
      // home: PacakgeInfoPage(title: 'PackageInfo example app'),
      // home: GetMyDeviceInfo(),
      // home: MyLoginPage(title: '로그인'),
      home: TodoListPage(),
    ),
  );
  // loadAddress();
  // loadProduct();
  // loadPage();
  makeDummyData();
}
