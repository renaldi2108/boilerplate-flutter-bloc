import 'package:bloc/bloc.dart';
import 'package:boilerplate/domain/entity/user/user_entity.dart';
import 'package:boilerplate/domain/usecase/user/user_usecase.dart';
import 'package:boilerplate/shared/core/base/state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'generated/user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _usecase;

  UserBloc(this._usecase) : super(UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.map(
        started: (_Started value) {  },
        fetchUser: (_FetchUser value) => _fetchUser(value, emit),
      );
    });
  }

  Future<void> _fetchUser(_FetchUser value, Emitter<UserState> emit) async {
    emit(state.copyWith(userState: BaseState.loading()));

    final fetch = await _usecase.call("");
    emit(fetch.fold(
          (failure) => state.copyWith(userState: BaseState.error(failure.failure as String)),
          (result) => state.copyWith(userState: BaseState.success(result)),
    ));
  }
}
