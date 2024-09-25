class RecipeReport {
  String reportId;
  String reportedBy; //신고한 사용자 ID
  String recipeId; //신고된 게시물(레시피) ID
  String reportReason; //신고 사유
  DateTime reportedAt; //신고일시
  ReportStatus status; // '처리 중', '완료', '무효화'
}

enum ReportStatus {
  inProgress, //처리중
  complete, //완료
  invalidation, //무효화
}
