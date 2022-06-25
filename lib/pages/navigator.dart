import 'package:flutter/material.dart';

// 1. Displaying a full-screen route 방식
// Navigator.push(context, MaterialPageRoute<void>(
//   builder: (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('My Page')),
//       body: Center(
//         child: TextButton(
//           child: Text('POP'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   },
// ));

// 1. Displaying a full-screen route 방식
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('라우트 관리 홈'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // 스택에 새 경로를 푸시하려면 화면에 표시하려는 모든 것을 생성하는 빌더 함수로 MatererialPageRoute 의 인스턴스를 생성할 수 있습니다.
                    // --> Navigator.of(context).push(MaterialPageRoute(builder: (_) => 위젯)),
                  },
                  child: Text('일반적인 라우트'))
            ],
          ),
        ));
  }
}

// -------------------------------------------------------------------------------

// 2. Named navigator routes 방식
// void main() {
//   runApp(MaterialApp(
//     home: MyAppHome(), // becomes the route named '/'
//     routes: <String, WidgetBuilder> {
//       '/a': (BuildContext context) => MyPage(title: 'page A'),
//       '/b': (BuildContext context) => MyPage(title: 'page B'),
//       '/c': (BuildContext context) => MyPage(title: 'page C'),
//     },
//   ));
// }

// 2. Named navigator routes 방식
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Navigator',
      // MaterialApp contains our top-level Navigator
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => const HomePage(),
        // '/signup': (BuildContext context) => const SignUpPage(),
      },
      // 위는 일반적인 Named 라우트 방식
      // get 에서는 어떻게 사용할까?
      // getPages: [GetPage(name: "/", page: () => Home())]
      // getPages: [GetPage(name: "/signup", page: () => SignUpPage())]
    );
  }
}

// ---------------------------------------------------------------------------------------------------



// Navigator.of(context).push(MaterialPageRoute(builder: (_) => 위젯)),
// --> Get.to(위젯)
//
// <뒤로가기>
// --> Get.back();
// --> Navigator.of(context).pop();


// Get.offAll(Home());
// --> 히스토리 삭제하면서 이동
// 회원가입 페이지 등 .. 정보를 안전하게 관리 가능
// Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(bhilder: (_) => 위젯), (route) => false);
// pushAndRemoveUntil: (buildContext context, Router<T> newRoute, RoutePredicate predicate) -> Future<T?>
// 위는 주어진 컨텍스트를 가장 밀접하게 둘러싸는 네비게이터에 주어진 경로를 푸시한 다음 predicatetrue를 반환할 때까지 이전 경로를 모두 제거합니다. [...]


// 두번째 named 방식
// Get.toNamed("/signup")
// == 일반적인 라우트 방식은
// Navigator.of(context).pushNamed("/signup");


// Get.offNamed("/signup")
// Get.toNamed 와의 차이점: 현재 페이지를 없애고 이 페이지로 이동하라 라는 의미


// Get.offAllNamed("/")
// 모든 히스토리 지우고 홈으로 이동하라 라는 의미






// argument 전달이란
// 1. Get.to(FirstPage(), arguments: "개남");
// 2. Get.toNamed("/first", arguments: "개남");


// arguments 사용법
// Text("${Get.arguments}");
// map 전달해서
// Text("${Get.arguments['name']}") 이렇게 쓸 수도 있다.


// class 전달도 가능
// class User { String name; int age; User({this.name, this.age})}
// Get.toNamed("/first", arguments: User(name: "개발하는 남자", age: 34));
// 받을 때에는 Text("${Get.arguments as User).name}") 이렇게 쓸 수도 있다.


// GetPage(name: "/user/:uid", page: () => UserPage(), transition: Transition.zoom)

