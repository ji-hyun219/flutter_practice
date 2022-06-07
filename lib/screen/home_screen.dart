import 'package:flutter/material.dart';

// stelss 로 위젯을 자동 생성할 수 있다.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // HomeScreen 에 Key 를 넣어줘도 되고 안 넣어줘도 됨
  // 넣어주면 부모 Constrctor 에 키 삽입.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: (Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                color: Colors.red,
                width: 50.0,
                height: 50.0,
              ),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                      width: 50.0, height: 50.0, color: Colors.yellow)),
              Icon(
                Icons.widgets,
                size: 50.0,
                color: Colors.orange,
              )
            ],
          ),
        )),
      ),
    );
  }
}
