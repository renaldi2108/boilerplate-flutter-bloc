import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/state.freezed.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial<T>;
  const factory BaseState.loading() = _Loading<T>;
  const factory BaseState.success(T data) = _Success<T>;
  const factory BaseState.error(String message) = _Error<T>;
}