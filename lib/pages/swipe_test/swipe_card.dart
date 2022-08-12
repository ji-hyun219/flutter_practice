import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_app/pages/page_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController(
    initialPage: 0,
  );

  int selectedIndex = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();

    // controller.addListener(() {
    //   setState(() {
    //    int currentPage = controller.page!.toInt();
    //    if ()
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('슬라이드'),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (int page) {
          setState(() {
            selectedIndex = page;
          });
        },
        children: [1, 2, 3, 4].map((e) {
          return e != 4
              ? Image.asset(
                  'img/tutorial$e.png',
                  fit: BoxFit.fill,
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              child: Image.asset(
                                'img/tutorial$e.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                                bottom: 100,
                                child: Container(
                                    width: 200, height: 200, color: Colors.red))
                          ],
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const PageViewPage()),
                            child: const Text('시작하기'),
                          ))
                    ],
                  ));
        }
            // (e) =>  Image.asset(
            //   'img/tutorial$e.png',
            //   fit: BoxFit.fill,
            // ),
            ).toList(),
      ),
    );
  }
}

Widget _indicator(bool isActive) {
  return SizedBox(
    height: 10,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 10 : 8.0,
      width: isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        boxShadow: [
          isActive
              ? BoxShadow(
                  color: const Color(0XFF2FB7B2).withOpacity(0.72),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                )
              : const BoxShadow(
                  color: Colors.transparent,
                )
        ],
        shape: BoxShape.circle,
        color: isActive ? const Color(0XFF6BC4C9) : const Color(0XFFEAEAEA),
      ),
    ),
  );
}
