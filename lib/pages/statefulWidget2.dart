import 'package:flutter/material.dart';

//앱 첫 실행
void main() {
  runApp(SampleApp());
}

//변하지 않는 위젯
//home에서는 변하는 위젯을 호출
class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

//변하는 위젯
class SampleAppPage extends StatefulWidget {
  const SampleAppPage({Key? key}) : super(key: key);

//StatefullWidget을 상속받으면, createState()를 오버라이드 함
//여기서 State를 상속받는 클래스를 리턴해줘야한다.
// => 는 return을 뜻함.
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

//State에 대한 내용을 구현
class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = "I Like Flutter";

  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

//body에서 chile의 Text에 업데이트되는 textToShow 값을 넘겨주고 있음.
//floatingActionButton을 onPressed하면 _updateText가 호출되면서
//textToShow의 값이 변경됨.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample App"),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
