import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/provider/recipe_providers.dart';
import 'package:eat_go/provider/user_providers.dart';
import 'package:eat_go/services/bookmark_service.dart';
import 'package:eat_go/viewmodels/bookmark_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// BookmarkService Provider
final bookmarkServiceProvider = Provider<BookmarkService>((ref) {
  return BookmarkService(
    userService: ref.watch(userServiceProvider),
    recipeService: ref.watch(recipeServiceProvider),
  );
});

/// 북마크 ViewModel Provider (family 패턴 - 사용자 정보 기반)
final bookmarkViewModelProvider =
    AsyncNotifierProvider.family<BookmarkViewModel, List<Recipe>?, EatGoUser?>(
  BookmarkViewModel.new,
);
