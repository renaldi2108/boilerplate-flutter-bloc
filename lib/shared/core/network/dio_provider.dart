part of 'network_util.dart';

@lazySingleton
class DioProvider {
  late Dio dio;
  late AppAlice _appAlice;

  DioProvider(this._appAlice) {
    // Initialize Dio
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    // Add prettydiologger
    dio.interceptors.add(PrettyDioLogger(requestHeader: true));

    // Add Alice Interceptor
    dio.interceptors.add(_appAlice.alice.getDioInterceptor());

    // Add Other Interceptors (e.g., logging, token handling)
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Logging Request
          print('Request: ${options.method} ${options.path}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Logging Response
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          // Logging Error
          print('Error: ${error.response?.statusCode} ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }
}
