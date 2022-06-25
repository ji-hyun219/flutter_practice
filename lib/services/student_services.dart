import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_app/models/student_model.dart';

// Object 에 접근하기
// student.fromJson 를 실행하고 Student 로 부터 변수를 가져오는 student_services.dart 의 코드를 작성
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Future loadStudent() async {
  String jsonString = await _loadAStudentAsset(); // 가공되지 않은 json 문자열을 가져옵니다
  final jsonResponse =
      json.decode(jsonString); // 가져온 Json 문자열을 dart 가 이해할 수 있게 해독합니다
  Student student = Student.fromJson(
      jsonResponse); // Student.fromJson 메소드를 활용해 해독한 json 응답을, Student 객체에 적합하게 deserialize 합니다.
  // 우리는 이제 Student 객체에 key 값에 접근할 수 있습니다
  print(student.studentScores);
}
