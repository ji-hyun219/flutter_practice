// /// 내가 보유한 SRT(코인) 조회
// Future<bool> getMySrt() async {
//   try {
//     final response = await SrtService().getMySrt();
//     final responseBody = response.data;
//     var accumulatedToken = responseBody["accumulatedToken"] as String;
//     var usedToken = responseBody["usedToken"] as String;
//     if (accumulatedToken.isEmpty) accumulatedToken = '0';
//     if (usedToken.isEmpty) usedToken = '0';
//     availableSrt.value =
//         (double.parse(accumulatedToken) - double.parse(usedToken)).toString();
//   } catch (e) {
//     return false;
//   }

//   return true;
// }
