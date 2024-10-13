/// 작업의 결과를 나타내는 제네릭 클래스. 성공 또는 실패 결과를 가질 수 있습니다.
/// 
/// [T]는 작업이 성공했을 때 반환되는 데이터의 타입입니다.
/// - 성공 시, [data]에는 결과가 저장되며, [error]는 `null`입니다.
/// - 실패 시, [error]에는 에러 메시지가 저장되며, [data]는 `null`입니다.
class OperationResult<T> {
  final T? data;
  final String? error;

  /// 성공한 작업의 결과를 위한 생성자.
  /// [data]에 성공 결과가 저장되며, [error]는 `null`로 설정됩니다.
  OperationResult.success(this.data) : error = null;

  /// 실패한 작업의 결과를 위한 생성자.
  /// [error]에 에러 메시지가 저장되며, [data]는 `null`로 설정됩니다.
  OperationResult.failure(this.error) : data = null;
}