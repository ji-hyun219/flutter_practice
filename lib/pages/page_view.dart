import 'dart:async';

import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int currentPage = controller.page!.toInt();

      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        controller.jumpToPage(0);
      }

      // if (nextPage == 4) {
      //   nextPage = 0;
      // }

      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
      // page 가 double 인 이유
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 메모리 절약

    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('페이지뷰')),
      body: Container(
        color: Colors.red,
        height: 20,
        child: PageView(
            // allowImplicitScrolling: false,
            scrollDirection: Axis.vertical,
            controller: controller,
            children: [0, 1, 2, 3, 4, 5]
                .map((e) => Text('1시간 전 {뒷번호 4자리}님이 0 포인트에 당첨 $e'))
                .toList()),
      ),
    );
  }
}
