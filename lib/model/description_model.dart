import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_model.freezed.dart';

part 'description_model.g.dart';

@freezed
sealed class Description with _$Description {
  const factory Description({
    required String description, // Step.N 설명 문단
    String? descriptionImgUrl, //Step.N 설명 이미지
  }) = _Description;

  factory Description.fromJson(Map<String, Object?> json) =>
      _$DescriptionFromJson(json);
}
