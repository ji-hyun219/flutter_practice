import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_app/pages/login/login_page.dart';

class LogOutPage extends StatefulWidget {
  final String id;
  final String password;
  const LogOutPage({Key? key, required this.id, required this.password})
      : super(key: key);

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  static const storage = FlutterSecureStorage();
  // 데이터를 이전 페이지에서 전달 받은 정보를 저장하기 위한 변수
  String? id;
  String? password;

  @override
  void initState() {
    id = widget.id; // widget.id 는 LogOutPage 에서 전달받은 id 를 의미한다.
    password = widget.password; // widget.pass LogOutPage 에서 전달 받은 pass 를 의미
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LogOut Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("id: $id"),
              Text("password : $password"),
              ElevatedButton(
                onPressed: () {
                  //delete 함수를 통하여 key 이름이 login인것을 완전히 폐기 시켜 버린다.
                  //이를 통하여 다음 로그인시에는 로그인 정보가 없어 정보를 불러 올 수가 없게 된다.
                  storage.delete(key: "login");
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const MyLoginPage(
                              title: "Login Page",
                            )),
                  );
                },
                child: const Text("Logout"),
              ),
            ],
          ),
        ));
  }
}
