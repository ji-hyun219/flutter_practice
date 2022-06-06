// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());  
//   // runApp() 함수는 주어진 Widget 값을 가져와 위젯 트리의 루트로 만듭니다.
//   // 아래의 예에서 위젯 트리는 두 개의 widget 으로 구성되는데
//   // Center 위젯과 그의 자식인 Text 이라는 두 개의 위젯으로 구성됩니다.
//   // 프레임워크는 루트 위젯이 화면을 덮도록 강제합니다.
//   // 즉, Hello world 텍스트가 하면 중앙에 표시됩니다.
//   // 이 경우 텍스트 방향(text direction) 을 지정해야 합니다.
//   // MaterialApp Widget 이 사용되면 나중에 설명하는 것처럼 이 작업이 자동으로 처리됩니다.
//   // 앱을 작성할 때 일반적으로 위젯이 상태를 관리하는지 여부에 따라 stateless 또는 StatefulWidget 하위 클래스인 새 위젯을 작성합니다.
//   // 한 위젯의 주요 작업은 build() 함수를 실행하는 것인데, 이는 다른 하위 레벨 위젯과 관련하여 위젯을 설명하는 기능을 구현하는 것입니다.
//   // 프레임워크는 위젯 의 지오메트리를 계산하고 설명하는 기본을 나타내는 위젯에서 프로세스가 끝날 때까지 이러한 위젯을 차례로 빌드합니다 .

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(
// //     const Center(
// //       child: Text(
// //         'Hello, world!',
// //         textDirection: TextDirection.ltr,
// //       ),
// //     ),
// //   );
// // }



// // < Basic Widget >
// // Flutter는 강력한 기본 위젯 모음과 함께 제공되며, 그 중 일반적으로 사용되는 위젯은 다음과 같습니다.
// // 1. Text 위젯
// // 2. Row, Column 위젯 - 플렉스 위젯을 사용하면 가로(Row), 세로(Column) 방향의 유연한 위젯을 설정할 수 있습니다. (웹의 flexBox 레이아웃 모델 기반)
// // 3. Stack 위젯 - 선형 방향(수평 또는 수직) 대신, Stack Widget 은 페인트 순서대로 서로 위에 배치할 수 있습니다.
// // 그런 다음 positioned 위젯(Stack 자식)을 사용하여  스택의 위쪽, 오른쪽, 아래쪽 또는 왼쪽 가장자리를 기준으로 자식을 배치할 수 있습니다. 
// // 스택은 웹의 절대 위치 레이아웃 모델을 기반으로 합니다.
// // 4. Container 위젯 - 직사각형 시각적 요소를 만들 수 있습니다.
// // BoxConatiner 는 배경, 테두리 또는 그림자를 decoration 할 수 있습니다.
// // 또한 크기에 여백, 패딩 및 제약조건을 설정할 수 있습니다.
// // 게다가 Container matrix 를 사용하여 3차원 공간을 수행할 수 있습니다.


// // import 'package:flutter/material.dart';

// // class MyAppBar extends StatelessWidget {
// //   const MyAppBar({required this.title, super.key});
// // MyAppBar 위젯은 Container 를 만드는데 56px 높이
// // 패딩은 오른쪽 왼쪽 모두 8px

// //   // Fields in a Widget subclass are always marked "final".

// //   final Widget title;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 56.0, // in logical pixels
// //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         // padding: const EdgeInsets.(all: 8.0)
// //       decoration: BoxDecoration(color: Colors.blue[500]),
// //       // Row is a horizontal, linear layout.
// //  * MyAppBar 은 Container 안에 자식들에게 Row 레이아웃을 쓴다.
// //       child: Row(
// //         // <Widget> is the type of items in the list.
// //         children: [
// //           const IconButton(
// //             icon: Icon(Icons.menu),
// //             tooltip: 'Navigation menu',
// //             onPressed: null, // null disables the button
// //           ),
// //           // Expanded expands its child
// //           // to fill the available space.
// //           Expanded(
// //             child: title,
// // title 위젯은 Expanded 로 표시됩니다
// // 즉, 다른 자식이 사용하지 않은 남아 있는 사용 가능한 공간을 채우기 위해 확장됩니다. 
// //           ),
// //           const IconButton(
// //             icon: Icon(Icons.search),
// //             tooltip: 'Search',
// //             onPressed: null,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MyScaffold extends StatelessWidget {
// //   const MyScaffold({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Material is a conceptual piece
// //     // of paper on which the UI appears.
// //     return Material(
// //       // Column is a vertical, linear layout.
// // * MyScaffold 위젯은 자식들을 Column 으로 배치
// //       child: Column(
// //         children: [
//   // * 최상위 자식은 MyAppBar 로 두며, Text 위젯에 its title 을 쓴다.
//   // AppBar 를 Text Widget 에 전달
//   //  위젯을 다른 위젯에 대한 인수로 전달하는 것은 다양한 방법으로 재사용할 수 있는 일반 위젯을 생성할 수 있는 강력한 기술입니다.
// //           MyAppBar(
// //             title: Text(
// //               'Example title',
// //               style: Theme.of(context) //
// //                   .primaryTextTheme
// //                   .headline6,
// //             ),
// //           ),
// //           const Expanded(
// //             child: Center(
// //               child: Text('Hello, world!'),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // 만약 하나의 위젯을 넓게 퍼뜨리고 싶다면
// // Row(
// //  children: [
// //    MyWidget(),
// //    Expanded(
// //        child: MyWidget()
// //    ),
// //      MyWidget(),
// //  ],
// // )

// // 변경될 수 없는 내용 먼저 나열합니다.
// // 변경될 수 있는 내용들이 나머지 공간을 나누어 가집니다. Expanded 처럼
// // Expanded(
// //    flex: 2,
// //    child: Container(),
// // ),


// // void main() {
// //   runApp(
// //     const MaterialApp(
// //       title: 'My app', // used by the OS task switcher
// //       home: SafeArea(
// //         child: MyScaffold(),
// //       ),
// //     ),
// //   );
// // }



// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {    
//     // BuildContext class 는 StatelessWidget.build 메서드와 State 개체 의 메서드 에서 사용할 수 있는 메서드 집합을 제공
//     // BuildContext 객체는 WidgetBuilder 함수(예: StatelessWidget.build )에 전달되고 State.context 멤버에서 사용할 수 있습니다.
//     return MaterialApp(
//       // 많은 테마데이터를 상속하기 위해 머터리얼 디자인 위젯이 제대로 표시되도록 MaterialApp 내부에 있어야 함
//       // Therefore, run the application with a MaterialApp.
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.green,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }



// // setState 호출될 때마다 rerun 되는 부분
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
