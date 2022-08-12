// import 'package:flutter/material.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// void main() => runApp(MyHomePage());

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TutorialCoachMark? tutorialCoachMark;
//   List<TargetFocus> targets = [];

//   GlobalKey key = GlobalKey();
//   final GlobalKey _key1 = GlobalKey();
//   final GlobalKey _key2 = GlobalKey();
//   final GlobalKey _key3 = GlobalKey();

//   @override
//   void initState() {
//     initTargets();
//     WidgetsBinding.instance.addPostFrameCallback(_layout);
//     super.initState();
//   }

//   void _layout(_) {
//     Future.delayed(const Duration(milliseconds: 100));
//     showTutorial();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text("Tutorial Coach Mark Demo"),
//         leading: const Icon(Icons.menu),
//         key: _key1,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Stack(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 170.0),
//               child: InkWell(
//                 onTap: () {
//                   showTutorial();
//                 },
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Container(
//                     key: key,
//                     color: Colors.orange[100],
//                     height: 100,
//                     width: MediaQuery.of(context).size.width - 50,
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         "assets/powered_by.png",
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: SizedBox(
//                 width: 50,
//                 height: 50,
//                 child: RaisedButton(
//                   key: _key2,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(50.0),
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: RaisedButton(
//                     key: _key3,
//                     onPressed: () {},
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void initTargets() {
//     targets.add(
//       TargetFocus(
//         identify: "Target 0",
//         keyTarget: _key1,
//         contents: [
//           TargetContent(
//               align: ContentAlign.bottom,
//               child: Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const <Widget>[
//                     Text(
//                       "Titulo lorem ipsum",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           fontSize: 20.0),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.0),
//                       child: Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//     targets.add(
//       TargetFocus(
//         identify: "Target 1",
//         keyTarget: key,
//         color: Colors.red,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             child: Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const <Widget>[
//                   Text(
//                     "Titulo lorem ipsum",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 20.0),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 10.0),
//                     child: Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//         shape: ShapeLightFocus.RRect,
//         radius: 5,
//       ),
//     );

//     targets.add(TargetFocus(
//       identify: "Target 2",
//       keyTarget: _key2,
//       contents: [
//         TargetContent(
//             align: ContentAlign.top,
//             child: Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: const <Widget>[
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 20.0),
//                     child: Text(
//                       "Multiples contents",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0),
//                     ),
//                   ),
//                   Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             )),
//         TargetContent(
//             align: ContentAlign.bottom,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.only(bottom: 20.0),
//                   child: Text(
//                     "Multiples contents",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0),
//                   ),
//                 ),
//                 Container(
//                   child: const Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ))
//       ],
//       shape: ShapeLightFocus.Circle,
//     ));
//     targets.add(TargetFocus(
//       identify: "Target 3",
//       keyTarget: _key3,
//       color: Colors.red,
//       contents: [
//         TargetContent(
//             align: ContentAlign.top,
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.network(
//                       "https://flutterdevs.com/wp-content/uploads/2020/10/logog.png",
//                       fit: BoxFit.contain,
//                       height: 120,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 20.0),
//                     child: Text(
//                       "Image Load network",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.0),
//                     ),
//                   ),
//                   const Text(
//                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ))
//       ],
//       shape: ShapeLightFocus.Circle,
//     ));
//   }


// void showTutorial() {
//     TutorialCoachMark(
//       context,
//       targets: targets, // List<TargetFocus>
//       colorShadow: Colors.red, // DEFAULT Colors.black
//        // alignSkip: Alignment.bottomRight,
//        // textSkip: "SKIP",
//        // paddingFocus: 10,
//       finish: (){
//         print("finish");
//       },
//       clickTarget: (target){
//         print(target);
//       },
//       clickSkip: (){
//         print("skip");
//       }
//     )..show();
//   }

// }
