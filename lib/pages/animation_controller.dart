import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isAnimate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // 모든 애니메이션 컨트롤러의 vsync 프로퍼티에 티커를 전달해야 한다
      // 이 예제 그리고 대부분의 상황에서는 State 객체 자신(this)이 티커다.
      // duration: const Duration(milliseconds: 1000),
      // 다트의 Duration 클래스로 애니메이션이 시작되고 끝날 때까지의 지속 시간을 정의한다.
    );
  }

  @override
  void dispose() {
    if (mounted == true) {
      _controller.dispose();
    }
    super.dispose();
  }

  // Future<void> startAnimation() async {
  //   await _controller.forward();
  //   // AnimationController.forward 는 컨트롤러에 애니메이션을 시작하도록 지시
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('애니메이션')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 400, color: Colors.red),
            Container(height: 400, color: Colors.yellow),
            VisibilityDetector(
              key: const Key('lottie-achive-widget'),
              onVisibilityChanged: (visibilityInfo) {
                var visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 50.0) {
                  if (isAnimate == false) {
                    _controller
                      ..duration = const Duration(seconds: 1)
                      ..forward(from: 0.0);
                    if (mounted) {
                      setState(() => isAnimate = true);
                    }
                  }
                } else {
                  if (mounted) {
                    _controller.stop();
                    setState(() => isAnimate = false);
                  }
                }
              },
              child: Lottie.asset(
                'assets/staking_success_700px.json',
                width: 100,
                height: 100,
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
