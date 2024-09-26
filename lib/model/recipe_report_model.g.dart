// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeReportImpl _$$RecipeReportImplFromJson(Map<String, dynamic> json) =>
    _$RecipeReportImpl(
      reportId: json['reportId'] as String,
      reportedBy: json['reportedBy'] as String,
      recipeId: json['recipeId'] as String,
      reportReason: json['reportReason'] as String,
      reportedAt: DateTime.parse(json['reportedAt'] as String),
      status: $enumDecode(_$ReportStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$RecipeReportImplToJson(_$RecipeReportImpl instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'reportedBy': instance.reportedBy,
      'recipeId': instance.recipeId,
      'reportReason': instance.reportReason,
      'reportedAt': instance.reportedAt.toIso8601String(),
      'status': _$ReportStatusEnumMap[instance.status]!,
    };

const _$ReportStatusEnumMap = {
  ReportStatus.inProgress: 'inProgress',
  ReportStatus.complete: 'complete',
  ReportStatus.invalidation: 'invalidation',
};
