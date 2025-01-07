import 'package:dartz/dartz.dart';
import 'package:boilerplate/shared/core/network/network_util.dart';

abstract class BaseRemoteSource {
  final ApiClient apiClient;

  BaseRemoteSource(this.apiClient);

  Future<Either<Fail, dynamic>> executeRequest(
      ApiMethod method,
      String endpoint, {
        Map<String, dynamic>? dataParameters,
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final response = await apiClient.exec(
        method,
        endpoint,
        dataParameters: dataParameters,
        queryParameters: queryParameters,
      );

      if (response.error == null) {
        return Right(response.data);
      } else {
        return Left(Fail(response.error ?? "Unknown error occurred"));
      }
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }
}
