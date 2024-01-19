// En core/network/dio_client.dart
import 'package:dio/dio.dart';

class DioClient {
  Dio createDio({required String baseUrl}) {
    Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));

    // Añade interceptores comunes aquí si son necesarios
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Manejar request
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Manejar response
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Manejar errores
          return handler.next(e);
        },
      )
    );

    // Headers
    dio.options.headers = {'Authorization': 'Bearer YOUR_TOKEN'};

    return dio;
  }
}