part of 'network_util.dart';

@lazySingleton
class ApiClient {
  final DioProvider _dioProvider;

  ApiClient(this._dioProvider);

  Future<ApiResponse> exec(
      ApiMethod method, String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic dataParameters}
  ) async {
    try {
      final response = await _executeRequest(method, endpoint,
          queryParameters: queryParameters, dataParameters: dataParameters);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return ApiResponse.error(handleError(e));
    } catch (e) {
      // Catch any other errors not related to Dio
      return ApiResponse.error('An unknown error occurred');
    }
  }

  Future<Response> _executeRequest(
      ApiMethod method,
      String endpoint, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? dataParameters,
      }) {
    switch (method) {
      case ApiMethod.GET:
        return _dioProvider.dio.get(endpoint, queryParameters: queryParameters);
      case ApiMethod.POST:
        return _dioProvider.dio.post(endpoint,
            queryParameters: queryParameters, data: dataParameters, options: Options(
              headers: {
                HttpHeaders.contentTypeHeader:"application/json",
                HttpHeaders.acceptHeader:"*/*"
              },
            ));
      case ApiMethod.DELETE:
        return _dioProvider.dio.delete(endpoint,
            queryParameters: queryParameters, data: dataParameters);
      case ApiMethod.PUT:
        return _dioProvider.dio.put(endpoint,
            queryParameters: queryParameters, data: dataParameters);
    }
  }
}

enum ApiMethod { GET, POST, DELETE, PUT }