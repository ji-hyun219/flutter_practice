import 'dart:async';

import 'package:flutter/material.dart';

class PageViewPage2 extends StatefulWidget {
  const PageViewPage2({Key? key}) : super(key: key);

  @override
  State<PageViewPage2> createState() => _PageViewPage2State();
}

class _PageViewPage2State extends State<PageViewPage2> {
  Timer? timer;
  final controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int currentPage = controller.page!.toInt();

      int nextPage = (currentPage + 1) % 5;

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
      appBar: AppBar(title: const Text('처음으로 정상적으로 돌아오기')),
      body: Container(
        color: Colors.red,
        height: 20,
        child: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return Center(
              // 0 -> 0
              // 1 -> 1
              // 2 -> 2
              // 3 -> 3
              // 4 -> 4
              // 5 -> 0
              child: Text('${index % 5}'),
            );
          },
        ),
      ),
    );
  }
}
