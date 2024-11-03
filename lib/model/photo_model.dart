import 'package:freezed_annotation/freezed_annotation.dart';

import 'author_attribution_model.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';
@freezed
sealed class Photo with _$Photo {
  const factory Photo({
    required String name,
    required int widthPx,
    required int heightPx,
    required List<AuthorAttribution> authorAttributions,
    required String flagContentUri,
    required String googleMapsUri,
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
