import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          var value = await Get.to(const SecondPage());
          value == true ? print('결괏값은 true 입니다') : print('결괏값은 false 입니다');
        },
        child: const Text('두번째 페이지로 이동'));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.back(result: false), child: const Text('뒤로 이동'));
  }
}
