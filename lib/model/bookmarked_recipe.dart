class BookmarkedRecipe {
  final String recipeId;
  final DateTime bookmarkedAt;

  BookmarkedRecipe({
    required this.recipeId,
    required this.bookmarkedAt,
  });
// factory BookmarkedRecipe.fromJson(Map<String, dynamic> json) {
//   return BookmarkedRecipe(
//     recipeId: json['recipeId'],
//     bookmarkedAt: (json['bookmarkedAt'] as Timestamp).toDate(),
//   );
// }
// Map<String, dynamic> toJson() {
//   return {
//     'recipeId': recipeId,
//     'bookmarkedAt': Timestamp.fromDate(bookmarkedAt),
//   };
// }
}
