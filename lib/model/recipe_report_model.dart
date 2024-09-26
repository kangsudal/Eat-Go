import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_report_model.freezed.dart';
part 'recipe_report_model.g.dart';

@freezed
sealed class RecipeReport with _$RecipeReport {
  const factory RecipeReport({
    required String reportId,
    required String reportedBy, //신고한 사용자 ID
    required String recipeId, //신고된 게시물(레시피) ID
    required String reportReason, //신고 사유
    required DateTime reportedAt, //신고일시
    required ReportStatus status, // '처리 중', '완료', '무효화'
  }) = _RecipeReport;

  factory RecipeReport.fromJson(Map<String, Object?> json) =>
      _$RecipeReportFromJson(json);
}

enum ReportStatus {
  @JsonValue("inProgress")
  inProgress, //처리중
  @JsonValue("complete")
  complete, //완료
  @JsonValue("invalidation")
  invalidation, //무효화
}
