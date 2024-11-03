import 'package:freezed_annotation/freezed_annotation.dart';
part 'author_attribution_model.freezed.dart';
part 'author_attribution_model.g.dart';

@freezed
sealed class AuthorAttribution with _$AuthorAttribution {
  const factory AuthorAttribution({
    required String displayName,
    required String uri,
    required String photoUri,
  }) = _AuthorAttribution;

  factory AuthorAttribution.fromJson(Map<String, Object?> json) => _$AuthorAttributionFromJson(json);
}