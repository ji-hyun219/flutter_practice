import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/models/routing_from_model.dart';

// argument 와 함께 이동

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          Get.to(() => const FourthPage(), arguments: RoutingFrom.TRUE);
        },
        child: const Text('페이지 이동'));
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          var value = Get.arguments;
          value == RoutingFrom.THIRD ? Get.back() : print('뒤로 갈 수 없습니다');
        },
        child: const Text('뒤로 이동'));
  }
}
