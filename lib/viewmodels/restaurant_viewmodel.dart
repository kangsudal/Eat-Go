import 'dart:async';
import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<Restaurant>, String> {
  late final RestaurantRepository _restaurantRepository;
  late String keyword;

  @override
  FutureOr<List<Restaurant>> build(String arg) {
    _restaurantRepository = ref.read(restaurantRepositoryProvider);
    keyword = arg;
    return fetchRestaurantByTextSearch();
  }

  Future<List<Restaurant>> fetchRestaurantByTextSearch() async {
    // API 호출 후 Restaurant 데이터 가져옴
    return _restaurantRepository.fetchRestaurantByTextSearch(keyword);
  }
}
