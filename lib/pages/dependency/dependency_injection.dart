import 'package:flutter/material.dart';

import '../getx.dart';

class HomePage extends StatelessWidget {
  final Controller controller; // create a variable of Controller type
  const HomePage({super.key, required this.controller}); // inject Controller dependency through constructor

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OtherPage extends StatelessWidget {
  final Controller someController = Controller(); // 컨트롤러 인스턴스화

  OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage(controller: someController); // 컨트롤러 인스턴스를 홈페이지에 전해줌
  }
}
