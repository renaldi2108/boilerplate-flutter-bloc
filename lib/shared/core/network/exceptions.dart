part of 'network_util.dart';

String handleError(DioException error) {
  // Return detailed message based on DioExceptionType
  if (error.response != null) {
    // HTTP response error
    return _handleHttpError(error.response?.statusCode);
  }

  // Handle DioExceptionType errors
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection Timeout';
    case DioExceptionType.sendTimeout:
      return 'Send Timeout';
    case DioExceptionType.receiveTimeout:
      return 'Receive Timeout';
    case DioExceptionType.cancel:
      return 'Request Cancelled';
    case DioExceptionType.unknown:
    return error.message ?? "Unexpected Error";
    default:
      return 'Unknown Error';
  }
}

String _handleHttpError(int? statusCode) {
  // Provide error messages based on HTTP status codes
  if (statusCode == null) {
    return 'Unknown HTTP Error';
  }

  switch (statusCode) {
    case 400:
      return 'Bad Request';
    case 401:
      return 'Unauthorized';
    case 403:
      return 'Forbidden';
    case 404:
      return 'Not Found';
    case 500:
      return 'Internal Server Error';
    default:
      return 'HTTP Error: $statusCode';
  }
}
