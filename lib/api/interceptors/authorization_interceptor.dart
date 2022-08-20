import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizationInterceptor extends Interceptor {
  final _dio = Dio();
  final storage = const FlutterSecureStorage();

  AuthorizationInterceptor() : super();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: 'ACCESS_TOKEN');
    options.headers['Authorization'] = 'Bearer $accessToken';

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // 400: cannot muliLogin
    // 엑세스 토큰, 리프레시 토큰 모두 삭제

    // 401
    // 엑세스 토큰, 리프레시 토큰 모두 읽음
  }
}
