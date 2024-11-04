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
    required String flagContentUri, // 사진 신고 페이지
    required String googleMapsUri, // 사진 동영상 탭 URI
  }) = _Photo;

  factory Photo.fromJson(Map<String, Object?> json) => _$PhotoFromJson(json);
}
