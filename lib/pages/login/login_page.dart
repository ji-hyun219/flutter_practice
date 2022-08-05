import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/pages/login/logout_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Secure Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyLoginPage(title: 'Secure Storage Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  final String title;
  const MyLoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController idController;
  late TextEditingController passController;
  String? userInfo; // user 의 정보를 저장하기 위한 변수

  static const storage =
      FlutterSecureStorage(); // flutter_secure_storage 사용을 위한 초기화 작업

  @override
  void initState() {
    idController = TextEditingController();
    passController = TextEditingController();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    // read 함수를 통하여 key 값에 맞는 정보를 불러오게 됩니다.
    // 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    // 데이터가 없을 때는 null 을 반환을 합니다.

    userInfo = await storage.read(key: "login");

    // Do not use BuildContexts across async gaps
    if (!mounted) return;

    // user 의 정보가 있다면 바로 로그아웃 페이지로 넘어가게 합니다
    if (userInfo != null) {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => LogOutPage(
                    id: userInfo!.split(" ")[1],
                    password: userInfo!.split(" ")[3],
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(labelText: "id"),
                  ),
                  TextField(
                    controller: passController,
                    decoration: const InputDecoration(labelText: "password"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // write 함수를 통하여 key에 맞는 정보를 적게 됩니다.
                      //{"login" : "id id_value password password_value"}
                      //와 같은 형식으로 저장이 된다고 생각을 하면 됩니다.
                      await storage.write(
                          key: "login",
                          value:
                              "id ${idController.text} password ${passController.text}");

                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LogOutPage(
                                  id: idController.text,
                                  password: passController.text,
                                )),
                      );
                    },
                    child: const Text("로그인"),
                  )
                ],
              ),
            )));
  }
}
