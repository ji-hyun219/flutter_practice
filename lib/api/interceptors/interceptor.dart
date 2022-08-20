import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Logging extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    logger.i('REQUEST[${options.method}] => PATH: ${options.path}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    logger.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e('ERROR: ${err.message}');
  }
}

// 이 예에서는 다양한 유형의 요청을 기록하기 위한 간단한 인터셉터를 정의합니다.
// Interceptor 를 확장한 Logging 이라는 새 클래스를 만듭니다

// 여기에서 Dio 요청에 의해 트리거되는 다양한 콜백을 재정의하고 콘솔에 요청을 기록하기 위해 
// 각 콜백에 Print 문을 추가했습니다.



// Add the interceptor to Dio during initialization:
/*
final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());
*/