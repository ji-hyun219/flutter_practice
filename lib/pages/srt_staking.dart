import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view_models/srt_view_model.dart';
import 'package:my_app/pages/srt_withdraw.dart';

class SrtStaking extends StatefulWidget {
  const SrtStaking({Key? key}) : super(key: key);

  @override
  State<SrtStaking> createState() => _SrtStakingState();
}

class _SrtStakingState extends State<SrtStaking> {
  final _viewModel = Get.put(SrtViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.stakingTimer();
  }

  @override
  Widget build(BuildContext context) {
    // print('------------');
    // print('초 출력: $secondDifference');
    // print('분 출력: $minuteDifference');
    // print('시간 출력: $hourDifference');
    // print('일 출력: $dayDifference');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Obx(
        () => SafeArea(
          child: _viewModel.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(children: [
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
                        _viewModel.dayDifference.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        '일',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        _viewModel.hourDifference.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        '시간',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        _viewModel.minuteDifference.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        '분',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        _viewModel.secondDifference.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Text(
                        '초',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const SrtWithdraw(),
                ]),
        ),
      ),
    );
  }
}
