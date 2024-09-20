/*class ConfirmedRecipe {
  final String recipeId;
  final List<DateTime> confirmedAt; // 레시피를 확정한 모든 시간
  final int confirmedCount;// 현재 이 사용자가 레시피를 확정한 횟수

  ConfirmedRecipe({
    required this.recipeId,
    required this.confirmedAt,
  }):confirmedCount = confirmedAt.length;
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
*/