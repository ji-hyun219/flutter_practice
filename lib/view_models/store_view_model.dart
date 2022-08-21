import 'package:get/get.dart';

class StoreViewModel extends GetxController {
  /// 인기 매장 조회
  Future<List<Store>> getPopularStores(
      double lat, double lon, int start) async {
    var result = <Store>[];
    try {
      final response = await StoreService()
          .getStores(lat, lon, "star", null, null, "distance", start);
      final storeList = response.data['data']
          .map<Store>((data) => Store.fromJson(data))
          .toList();
      result = storeList;
      update();
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
