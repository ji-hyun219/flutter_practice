import 'package:dio/dio.dart';
import 'package:my_app/models/user_info_model.dart';

class DioPutClient {
  final Dio _dio = Dio();

  final _baseUrl = "https://reqres.in/api";

  Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      Response response = await _dio.put(
        '$_baseUrl/users/$id',
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
      await _dio.delete('$_baseUrl/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
