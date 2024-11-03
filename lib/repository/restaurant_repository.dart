import 'package:eat_go/model/restaurant_model.dart';
import 'package:eat_go/services/restaurant_service.dart';

class RestaurantRepository {
  final RestaurantService _restaurantService;

  RestaurantRepository({required RestaurantService restaurantService})
      : _restaurantService = restaurantService;

  Future<List<Restaurant>> fetchRestaurantByTextSearch(String keyword){
    return _restaurantService.fetchRestaurantByTextSearch(keyword: keyword);
  }
}
