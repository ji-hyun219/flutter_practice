import 'dart:async';

import 'package:get/get.dart';
import 'package:my_app/models/staking_period_model.dart';
import 'package:my_app/services/srt_service.dart';

class SrtViewModel extends GetxController {
  final staking =
      StakingPeriod(termintaion: null, inProgress: null, preparation: null).obs;
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  Timer? timer;
  final dayDifference = 0.obs;
  // late
  // 나중에 이 변수를 초기화하겠다고 약속했지만
  // 그러나 이 약속은 빌드 메서드 내에서 해당 변수를 사용할 때 의미가 없습니다.
  // 따라서 ? 사용
  final hourDifference = 0.obs;
  final minuteDifference = 0.obs;
  final secondDifference = 0.obs; // 에러는 아니지만 null 호출
  final isLoading = false.obs;

  void getStakingData() {
    final responseData = StakingService().getStakingData();
    if (responseData.isEmpty) return;

    staking.value = StakingPeriod.fromMap(responseData);

    if (staking.value.inProgress != null) {
      startDate.value = DateTime.parse(staking.value.inProgress!.startAt)
          .add(const Duration(hours: 9));
      endDate.value = DateTime.parse(staking.value.inProgress!.endAt)
          .add(const Duration(hours: 9));

      // date format 한거 -> DateTime.parse 안됨
    }

    // if (staking.value.preparation != null) {
    //   startDate.value = DateTime.parse(
    //       df.format(DateTime.parse(staking.value.preparation!.startAt)));
    //   endDate.value = DateTime.parse(
    //       df.format(DateTime.parse(staking.value.preparation!.endAt)));
    // }
  }

  Future stakingTimer() async {
    try {
      isLoading.value = true;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        secondDifference.value =
            endDate.value.difference(DateTime.now()).inSeconds;

        minuteDifference.value = (secondDifference / 60).floor();
        hourDifference.value = (minuteDifference / 60).floor();
        secondDifference.value = (secondDifference % 60).floor();
        minuteDifference.value = (minuteDifference % 60).floor();
        dayDifference.value = (hourDifference / 24).floor();
        hourDifference.value = (hourDifference % 24).floor();
      });
      return timer;
    } catch (e) {
      return;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // onInit 을 사용하기 위해 class 를 extends GetxController 처리
    // obs 로 설정한 변수를 관찰하면서
    // '그 변수의 값이 변경될 때만' -> onInit 내부 method 가 호출
    super.onInit();
    getStakingData();
  }
}
