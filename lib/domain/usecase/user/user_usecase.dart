import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:boilerplate/domain/entity/user/user_entity.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/shared/core/base/usecase.dart';

@injectable
class UserUsecase extends UseCase<Either<Fail, List<UserEntity>>, String> {
  final UserRepository _repository;
  UserUsecase(this._repository);

  @override
  Future<Either<Fail, List<UserEntity>>> call(String params) => _repository.user();
}