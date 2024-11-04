import 'package:freezed_annotation/freezed_annotation.dart';
part 'author_attribution_model.freezed.dart';
part 'author_attribution_model.g.dart';

@freezed
sealed class AuthorAttribution with _$AuthorAttribution {
  const factory AuthorAttribution({
    required String displayName, // 사진 올린 사람 닉네임
    required String uri, // 이 사람이의 모든 리뷰 모음집
    required String photoUri, // 이 사람의 썸네일
  }) = _AuthorAttribution;

  factory AuthorAttribution.fromJson(Map<String, Object?> json) =>
      _$AuthorAttributionFromJson(json);
}
