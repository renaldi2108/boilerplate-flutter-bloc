part of 'network_util.dart';

class ApiResponse {
  final bool isSuccess;
  final dynamic data;
  final String? error;

  ApiResponse.success(this.data)
      : isSuccess = true,
        error = null;

  ApiResponse.error(this.error)
      : isSuccess = false,
        data = null;
}
