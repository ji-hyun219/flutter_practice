import 'dart:math';

List<String> resultData = [];
final gift = ['100,000', '49,680', '10,000', '5,555', '2,020', '1,004'];
final percentage = [1, 2, 3, 4, 60, 95];

List<String> makeDummyData() {
  int randNum;
  for (int i = 0; i < gift.length; i++) {
    randNum = Random().nextInt(99) + 1; // 1 ~ 100
    for (int j = 0; j < gift.length; j++) {
      if (percentage[j] >= randNum) {
        print('당첨된 포인트 percentage: ${percentage[j]}');
        resultData.add((gift[j]));
        break;
      }
    }
    if (randNum > percentage[5]) {
      // ex) 99 > 95
      print('당첨된 포인트 percentage: 95');
      resultData.add(gift[5]);
    }
  }

  print('당첨 포인트: $resultData');
  return resultData;
}
