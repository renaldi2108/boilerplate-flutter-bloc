import 'package:boilerplate/shared/core/base/remote_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:boilerplate/shared/core/network/network_util.dart';

@injectable
class UserRemoteSource extends BaseRemoteSource {

  UserRemoteSource(ApiClient apiClient): super(apiClient);

  Future<Either<Fail, dynamic>> user() async => executeRequest(
      ApiMethod.GET,
      "/users",
  );
}