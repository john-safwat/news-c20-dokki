import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "https://newsapi.org",
      receiveTimeout: Duration(seconds: 180),
      connectTimeout: Duration(seconds: 180),
      headers: {'Authorization': 'Bearer 2c58c6392813448996cbedf8b2cd9b2e'},
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 140,
      ),
    );
    dio.interceptors.add(ChuckerDioInterceptor());
    return dio;
  }
}
