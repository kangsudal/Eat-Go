class ConfirmedRecipe {
  final String recipeId;
  final List<DateTime> confirmedAt;
  final int confirmedCount;

  ConfirmedRecipe({
    required this.recipeId,
    required this.confirmedAt,
    required this.confirmedCount,
  });
// factory ConfirmedRecipe.fromJson(Map<String, dynamic> json) {
//   return ConfirmedRecipe(
//     recipeId: json['recipeId'],
//     confirmedAt: (json['confirmedAt'] as List<dynamic>).map((timestamp) => (timestamp as Timestamp).toDate()).toList(),
//     confirmedCount: json['confirmedCount'],
//   );
// }
// Map<String, dynamic> toJson() {
//   return {
//     'recipeId': recipeId,
//     'confirmedAt': confirmedAt.map((date) => Timestamp.fromDate(date)).toList(),
//     'confirmedCount': confirmedCount,
//   };
// }
}
