import 'package:get/get.dart';
import 'package:my_app/api/dio_client.dart';
import 'package:dio/dio.dart' as dio; // for dio.Response

class StoreService {
  final _api = Get.find<DioClient>();

  /// 매장 조회
  Future<dio.Response> getStores2(double lat, double lon, String? type,
      List<String>? categoryIds, String? search, String? orderBy, int start,
      {int perPage = 10}) async {
    final parameters = {
      'lat': lat.toString(),
      'lon': lon.toString(),
      if (type != null) 'type': type,
      if (categoryIds != null) 'categoryIds': categoryIds,
      if (search != null) 'search': search,
      if (orderBy != null) 'orderBy': orderBy,
      'start': start.toString(),
      'perPage': perPage.toString()
    };

    try {
      final response =
          await _api.get(Endpoints.stores, queryParameters: parameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
