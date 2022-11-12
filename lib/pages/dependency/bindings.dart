// // 바인딩 -> dependency 를 injection 하는 방법이다 (route 단계에서 할 수 있음)
// // bindings 를 상속하고, dependencies 를 override 한다
// // bindings 를 통해
// // View 와 Controll 코드를 좀 더 분리해서 사용 가능하다
// // bindings 는 dependency 를 정의하고
// // 이를 route 에 연결한다
// // 이를 활용하기 위해서 꼭 getx route 시스템을
// // 꼭 이용해야 한다

// // controller 를 route 에 따라 관리할 수 있기 때문에 편하다
// // 페이지에 필요한 컨트롤러를 바인딩하여 전달하면
// // 페이지가 생성되면서 바로 인스턴스가 선언되어
// // 사용 가능한 상태가 되고 페이지에서 빠져 나오면
// // 곧바로 해당 페이지에서 등록되어 사용되었던 인스턴스(컨트롤러)가
// // 자동 삭제 처리된다

// // 1. extends : 부모에서 선언/정의를 모두 하여 자식은 메소드/변수를 그대로 사용할 수 있음
// // 2. implements (interface 구현) : 부모 객체는 선언만 하여 정의(내용)은 자식에서 오버라이딩 해야 함
// // 3. abstract : extends 와 interface 혼합. extends 하되 몇 개는 추상 메소드로 구현되어 있음

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../getx.dart';

// class HomeBinding implements Bindings {
//   @override
//   void dependcies() {
//     Get.put<Controller1>(Controller1()); // 정의할 컨트롤러들
//     Get.put<Controller2>(Controller2());
//   }
// }


// // 위에 정의된 dependency 를 route 에 바인딩
// GetMaterialApp({
//   initialRoute = '/',
//   initialBinding = HomeBinding() // app 시작과 동시에 dependencies 를 만들 수 있다
//   getPages: [
//     GetPage(name: '/', page: () => HomePage(), binding: HomeBinding()), // here
//   ],
// }
// )


// // 즉, 바인딩은 route 단계에서 의존성 주입하는거다



// // * View
// // Get.find 를 통해 controller 를 view 에서 사용 가능
// class HomePage extends StatelessWidget {
//   Controller controller = Get.find();

// }


// // 왜 굳이 컨트롤러를 route 에 묶어야 하는 걸까
// // 묶지 않고도 처리할 수 있지만 묶는 것도 하나의 방법
// // controller 가 10개쯤 되는데 특정 페이지(view) 내에서 정의해서 사용하면 코드가 복잡해진다
// // 근데 만일 binding 을 통해 route 에 묶는다면 훨씬 깔끔해질 것이다