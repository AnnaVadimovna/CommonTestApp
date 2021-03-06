import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  Dio getDio() => Dio()..interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
  @Named("BASE_URL")
  String getBaseUrl() => "https://us-central1-mynextbase-connect.cloudfunctions.net";
  @Named("RETRY_DURATION")
  Duration getRetryDuration() => const Duration(milliseconds: 200);
}
