import 'dart:async';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/provider/location_providers.dart';
import 'package:eat_go/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<Restaurant>, String> {
  // Late 초기화 대신 getter 사용으로 안전성 향상
  RestaurantRepository get _restaurantRepository =>
      ref.read(restaurantRepositoryProvider);

  late String _keyword;

  @override
  FutureOr<List<Restaurant>> build(String arg) {
    _keyword = arg;
    return fetchRestaurantByTextSearch();
  }

  Future<List<Restaurant>> fetchRestaurantByTextSearch() async {
    // API 호출 후 Restaurant 데이터 가져옴
    return _restaurantRepository.fetchRestaurantByTextSearch(_keyword);
  }
}
