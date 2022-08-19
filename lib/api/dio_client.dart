import 'package:dio/dio.dart';
import 'package:my_app/api/interceptors/interceptor.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/models/user_info_model.dart';

class DioClient {
  // TODO: Set up and define the methods for network operations

  // You can initialize Dio using the following:
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  // final _baseUrl =
  //     "https://reqres.in/api"; // Define the base URL of the API server:

  // TODO: Add methods
  // Defining the GET request

  // Future<User> getUser({required String id}) async {
  //     // Perform GET request to the endpoint "/users/<id>"
  //     Response userData = await _dio.get(_baseUrl + '/users/$id');

  //     // Prints the raw data returned by the server
  //     print('User Info: ${userData.data}');

  //     // Parsing the raw JSON data to the User class
  //     User user = User.fromJson(userData.data);

  //     return user;
  //   }

  // 위의 방법은 작동하지만 여기에 코딩 오류가 있으면 앱을 실행할 때 앱이 충돌합니다.
  // 이를 수행하는 더 좋고 기능적인 방법은 get 메서드를 try-catch 블록으로 래핑하는 것입니다.

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get('/users/$id');
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '/users',
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

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      Response response = await _dio.put(
        '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }

  Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete('/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
