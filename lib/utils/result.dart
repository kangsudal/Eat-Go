/// Result 타입: 성공/실패를 명시적으로 처리하기 위한 sealed class
///
/// 사용 예시:
/// ```dart
/// Future<Result<User>> getUser(String id) async {
///   try {
///     final user = await userService.fetchUser(id);
///     return Success(user);
///   } catch (e) {
///     return Failure('사용자를 찾을 수 없습니다', e as Exception?);
///   }
/// }
///
/// // 사용 시
/// final result = await getUser('123');
/// switch (result) {
///   case Success(:final data):
///     print('사용자: $data');
///   case Failure(:final message):
///     print('오류: $message');
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// 성공 여부 확인
  bool get isSuccess => this is Success<T>;

  /// 실패 여부 확인
  bool get isFailure => this is Failure<T>;

  /// 성공 시 데이터 반환, 실패 시 null 반환
  T? get dataOrNull => switch (this) {
        Success(:final data) => data,
        Failure() => null,
      };

  /// 성공 시 데이터 반환, 실패 시 기본값 반환
  T dataOr(T defaultValue) => switch (this) {
        Success(:final data) => data,
        Failure() => defaultValue,
      };

  /// 결과를 변환
  Result<R> map<R>(R Function(T data) transform) => switch (this) {
        Success(:final data) => Success(transform(data)),
        Failure(:final message, :final exception) => Failure(message, exception),
      };

  /// 결과에 따라 콜백 실행
  void when({
    required void Function(T data) success,
    required void Function(String message, Exception? exception) failure,
  }) {
    switch (this) {
      case Success(:final data):
        success(data);
      case Failure(:final message, :final exception):
        failure(message, exception);
    }
  }
}

/// 성공 결과
final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'Success($data)';
}

/// 실패 결과
final class Failure<T> extends Result<T> {
  const Failure(this.message, [this.exception]);

  final String message;
  final Exception? exception;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<T> &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() =>
      'Failure($message${exception != null ? ', $exception' : ''})';
}
