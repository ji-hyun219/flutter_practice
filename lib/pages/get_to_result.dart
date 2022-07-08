import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/models/routing_from_model.dart';

// 전환되는 페이지로부터 데이터 받기

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          var value = await Get.to(const SecondPage());
          value == RoutingFrom.TRUE
              ? print('결괏값은 true 입니다')
              : print('결괏값은 false 입니다');
        },
        child: const Text('두번째 페이지로 이동'));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.back(result: RoutingFrom.FALSE),
        child: const Text('뒤로 이동'));
  }
}
