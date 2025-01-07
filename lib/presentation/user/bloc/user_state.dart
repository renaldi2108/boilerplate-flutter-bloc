part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(BaseState.initial()) BaseState<List<UserEntity>> userState,
  }) = _UserState;

  factory UserState.initial() => const UserState();
}
