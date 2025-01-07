import 'package:dartz/dartz.dart';
import 'package:boilerplate/shared/core/base/entity.dart';

abstract class BaseRepository {
  Future<Either<Fail, T>> handleRemoteResponse<T>(
      Future<Either<Fail, dynamic>> remoteCall,
      T Function(dynamic) fromJson, {
        bool useBaseResponse = false
      }) async {
    final res = await remoteCall;
    return res.fold(
          (fail) => Left(fail),
          (response) {
        try {
          if (useBaseResponse) {
            final baseResponse = BaseEntity<T>.fromJson(response, fromJson);
            if (baseResponse.code == 200) {
              return Right(baseResponse.data!);
            } else {
              return Left(Fail(baseResponse.error ?? 'Unknown error'));
            }
          } else {
            final data = fromJson(response);
            return Right(data);
          }
        } catch (e) {
          return Left(Fail('Failed to parse response: $e'));
        }
      },
    );
  }
}