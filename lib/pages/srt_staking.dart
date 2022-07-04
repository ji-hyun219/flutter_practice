import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view_models/srt_view_model.dart';

class SrtStaking extends StatefulWidget {
  const SrtStaking({Key? key}) : super(key: key);

  @override
  State<SrtStaking> createState() => _SrtStakingState();
}

class _SrtStakingState extends State<SrtStaking> {
  final _viewModel = Get.put(SrtViewModel());

  Timer? timer;

  int? dayDifference;
  // late
  // 나중에 이 변수를 초기화하겠다고 약속했지만
  // 그러나 이 약속은 빌드 메서드 내에서 해당 변수를 사용할 때 의미가 없습니다.
  // 따라서 ? 사용
  int? hourDifference;
  int? minuteDifference;
  int? secondDifference; // 에러는 아니지만 null 호출

  void stakingTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondDifference =
          _viewModel.endDate.value.difference(DateTime.now()).inSeconds;
      minuteDifference = (secondDifference! / 60).floor();
      hourDifference = (minuteDifference! / 60).floor();
      secondDifference = (secondDifference! % 60).floor();
      minuteDifference = (minuteDifference! % 60).floor();
      dayDifference = (hourDifference! / 24).floor();
      hourDifference = (hourDifference! % 24).floor();
      print('------------');
      print('초 출력: $secondDifference');
      print('분 출력: $minuteDifference');
      print('시간 출력: $hourDifference');
      print('일 출력: $dayDifference');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stakingTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SafeArea(
          child: Column(
        children: [
          RichText(
              text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: _viewModel.startDate.value.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: ' ~ ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: _viewModel.endDate.value.toString(),
                style: const TextStyle(color: Colors.blue),
              ),
              const TextSpan(
                text: '까지',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                dayDifference.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                '일',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                hourDifference.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                '시간',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                minuteDifference.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                '분',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                secondDifference.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Text(
                '초',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ],
      )),
    );
  }
}
