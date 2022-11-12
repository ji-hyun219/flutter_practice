// GetX 에서는 어떻게 할까
// Get put 과 find 활용

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:my_app/pages/getx.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller controller = Get.put(Controller());
  // instead of Controller controller = Controller;
  // = 정의하는 것
  // Get create 와 같다
  // 어디에다 넘겨줄지 정해주지 않는다

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OtherPage extends StatelessWidget {
  OtherPage({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
