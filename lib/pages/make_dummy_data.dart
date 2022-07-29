import 'dart:math';

List<Map<String, String>> resultData = [];
// List<int> cumulative = []; // [1, 3, 6, 10, 70, 165]
final gift = ['100,000', '49,680', '10,000', '5,555', '2,020', '1,004'];
final percentage = [1, 2, 3, 4, 60, 95];

List<Map<String, String>> makeDummyData() {
  // 1. 포인트 더미 데이터
  int sum = 0;

  // 누적 확률 구하기 (객체지향 프로그래밍)
  // for (int i = 0; i < percentage.length; i++) {
  //   sum += percentage[i];
  //   cumulative.add(sum);
  // }

  // 누적 확률 구하기 (함수형 프로그래밍)
  final cumulative = percentage.map((e) {
    sum += e;
    return sum;
  }).toList();

  print('누적확률에 대한 함수형 프로그래밍으로 작성: $cumulative'); // [1, 3, 6, 10, 70, 165]

  for (int i = 0; i < gift.length; i++) {
    int randPointNum = Random().nextInt(164) + 1;
    print('랜덤 포인트: $randPointNum');
    for (int j = 0; j < gift.length; j++) {
      if (randPointNum <= cumulative[j]) {
        // 84 <= 165
        resultData.add({'point': gift[j]}); // 1,004
        print('확률: ${cumulative[j]}');

        break;
      }
    }
  }

  // 2. 핸드번 번호 뒷자리 더미 데이터
  for (int i = 0; i < gift.length; i++) {
    int randPhoneNum = Random().nextInt(8999) + 1000;
    resultData[i] = {...resultData[i], 'phone': randPhoneNum.toString()};
  }

  // JS 함수형 프로그래밍
  //   resultData = gift.map((e, i) => {
  //   return {...resultData[i], 'phone': e};
  // })

  // 3. 당첨 시간 더미 데이터
  for (int i = 0; i < gift.length; i++) {
    int randDateNum = Random().nextInt(4) + 2; // 0 - 4 >> 2 - 6
    resultData[i] = {...resultData[i], 'date': randDateNum.toString()};
  }

  print('당첨 결과 확인: $resultData');
  return resultData;
}
