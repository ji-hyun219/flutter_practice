import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/one_button_dialog.dart';
import 'package:my_app/pages/todo_list.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  bool isValidEmail = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      isValidEmail = false;
    });
  }

  Future<dynamic> _verifyEmail() async {
    isValidEmail = true;
    return await Get.dialog(
        const OneButtonDialog(title: '알림', content: '검증 완료 되었습니다.'));
  }

  Future<dynamic> _next() async {
    if (isValidEmail == false) {
      return await Get.dialog(
          const OneButtonDialog(title: '알림', content: '이메일 검증 실패\n다시 입력해주세요'));
    }
    return await Get.to(const TodoList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('회원가입 연습')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'E-mail 주소 입력 (필수)',
                ),
                Stack(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: '이메일 입력',
                        contentPadding: EdgeInsets.only(
                          left: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Positioned(
                        right: 0,
                        child: ElevatedButton(
                            onPressed: _verifyEmail, child: const Text('검증'))),
                  ],
                ),
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: _next, child: const Text('다음')))
              ],
            ),
          ),
        ));
  }
}
