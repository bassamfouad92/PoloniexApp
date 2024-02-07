abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<dynamic> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> post(
      String endpoint, {
        Map<String, dynamic>? data,
      });
}