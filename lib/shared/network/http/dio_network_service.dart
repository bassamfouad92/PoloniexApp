import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../configs/app_configs.dart';
import 'network_service.dart';

class DioNetworkService extends NetworkService {

  static final Dio dio = Dio();

  DioNetworkService() {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = dio.post(baseUrl+endpoint, queryParameters: data);
    return res;
  }

  @override
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = dio.get(baseUrl+endpoint, queryParameters: queryParameters);
    return res;
  }
}