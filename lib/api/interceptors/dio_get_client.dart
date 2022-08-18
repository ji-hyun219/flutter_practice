import 'package:dio/dio.dart';
import 'package:my_app/models/user.dart';

class DioClient {
  // TODO: Set up and define the methods for network operations

  final Dio _dio = Dio(); // You can initialize Dio using the following:

  final _baseUrl =
      "https://reqres.in/api"; // Define the base URL of the API server:

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
      Response userData = await _dio.get('$_baseUrl/users/$id');
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
}
