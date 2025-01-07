import 'package:boilerplate/shared/core/base/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:boilerplate/data/remote/user/user_remote_source.dart';
import 'package:boilerplate/domain/entity/user/user_entity.dart';

abstract class UserRepository {
  Future<Either<Fail, List<UserEntity>>> user();
}

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final UserRemoteSource _remoteSource;

  UserRepositoryImpl(this._remoteSource,);

  @override
  Future<Either<Fail, List<UserEntity>>> user() async {
    return handleRemoteResponse(
      _remoteSource.user(), (data) {
        return (data as List).map((item) => UserEntity.fromJson(item)).toList();
    },
      useBaseResponse: false,
    );
  }
}