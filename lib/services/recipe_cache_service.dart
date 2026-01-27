import 'package:eat_go/model/recipe_model.dart';

/// 레시피 캐시 서비스
///
/// 메모리 캐시를 사용하여 Firebase 호출을 줄이고 성능을 개선합니다.
class RecipeCacheService {
  RecipeCacheService();

  final Map<String, Recipe> _cache = {};
  final Map<String, DateTime> _timestamps = {};
  final Duration _cacheDuration = const Duration(minutes: 5);

  /// 캐시에서 레시피를 가져옵니다.
  /// 캐시가 만료되었거나 없으면 null을 반환합니다.
  Recipe? get(String recipeId) {
    final timestamp = _timestamps[recipeId];
    if (timestamp != null &&
        DateTime.now().difference(timestamp) < _cacheDuration) {
      return _cache[recipeId];
    }
    // 캐시 만료 시 삭제
    if (timestamp != null) {
      _cache.remove(recipeId);
      _timestamps.remove(recipeId);
    }
    return null;
  }

  /// 캐시에 레시피를 저장합니다.
  void set(String recipeId, Recipe recipe) {
    _cache[recipeId] = recipe;
    _timestamps[recipeId] = DateTime.now();
  }

  /// 여러 레시피를 한번에 캐시에 저장합니다.
  void setAll(List<Recipe> recipes) {
    final now = DateTime.now();
    for (final recipe in recipes) {
      _cache[recipe.recipeId] = recipe;
      _timestamps[recipe.recipeId] = now;
    }
  }

  /// 특정 레시피의 캐시를 무효화합니다.
  void invalidate(String recipeId) {
    _cache.remove(recipeId);
    _timestamps.remove(recipeId);
  }

  /// 전체 캐시를 비웁니다.
  void clear() {
    _cache.clear();
    _timestamps.clear();
  }

  /// 캐시된 레시피 목록에서 ID로 조회합니다.
  /// 캐시에 있는 것만 반환하고, 없는 ID는 반환하지 않습니다.
  List<Recipe> getByIds(List<String> recipeIds) {
    final List<Recipe> results = [];
    for (final id in recipeIds) {
      final recipe = get(id);
      if (recipe != null) {
        results.add(recipe);
      }
    }
    return results;
  }

  /// 캐시에 없는 ID 목록을 반환합니다.
  List<String> getMissingIds(List<String> recipeIds) {
    return recipeIds.where((id) => get(id) == null).toList();
  }
}
