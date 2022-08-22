// Future<void> refreshData() async {
//   bool result = false;
//   isLoading.value = true;

//   cleanPointToSrt();

//   await getStakingData();
//   if (stakingData.value.inProgress != null) {
//     await getStakingToken();
//   }
//   try {
//     await getMySrt();
//   } on ApiExceptions catch (e) {
//     await Get.dialog(
//       OneButtonDialog(
//         title: '알림',
//         content: '내가 보유한 SRT 조회 실패 : ${e.toString()}',
//       ),
//       barrierDismissible: false,
//     );
//     Get.back();
//   } catch (e) {
//     await Get.dialog(
//       OneButtonDialog(
//         title: '알림',
//         content: '일시적인 시스템 오류에요',
//       ),
//       barrierDismissible: false,
//     );
//     Get.back();
//   }

//   result = await getCurrentRate();
//   if (result == false) {
//     Get.back();
//   }

//   result = await getWalletList(
//       '0', totalWallet.value == '0' ? '10' : totalWallet.value);
//   if (result == false) {
//     Get.back();
//   }

//   getTime();

//   isLoading.value = false;
// }
