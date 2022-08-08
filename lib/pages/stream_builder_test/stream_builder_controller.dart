// 스트림 컨트롤러는 여러 리스너(구독 & 상태) 를 관리한다.
// 아래의 예제는 값이 추가될 때마다 출력하는 소스이다.

import 'dart:async';

void main() {
  StreamController ctrl = StreamController();

  ctrl.stream.listen((data) {
    print(data);
  });

  ctrl.add(1);
  ctrl.add("Hello Stream");
  ctrl.add({"frist": 10, "tow": "20"});

  ctrl.close();
}

/*
플러터에서는 스트림 빌더를 써서 스트림 처리를 한다.
스트림 빌더를 쓰면 setState() 를 쓰지 않고도 UI 를 업데이트할 수 있다.
또 항상 스트림의 최신값을 가져오니, 최신값을 확인할 필요가 없다.
*/
