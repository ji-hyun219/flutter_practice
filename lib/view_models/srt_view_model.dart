import 'package:get/get.dart';
import 'package:my_app/models/staking_period_model.dart';
import 'package:my_app/services/srt_service.dart';

class SrtViewModel extends GetxController {
  final staking =
      StakingPeriod(termintaion: null, inProgress: null, preparation: null).obs;
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

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

  @override
  void onInit() {
    // onInit 을 사용하기 위해 class 를 extends GetxController 처리
    // obs 로 설정한 변수를 관찰하면서
    // '그 변수의 값이 변경될 때만' -> onInit 내부 method 가 호출
    super.onInit();
    getStakingData();
  }
}
