import 'package:dio/dio.dart';
import 'package:my_app/models/user_info_model.dart';

class DioPostClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://reqres.in/api";

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '$_baseUrl/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }
  // 이것은 UserInfo 객체를 매개변수로 사용하여 API 의 끝점으로 보냅니다.
  // 새로 생성된 사용자 정보와 생성 날짜 및 시간이 포함된 응답을 반환합니다.
}
