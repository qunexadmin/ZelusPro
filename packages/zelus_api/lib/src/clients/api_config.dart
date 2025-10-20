/// API Configuration
class ApiConfig {
  /// Base URL for the Zelus API
  static const String baseUrl = 'http://3.24.31.8:8006/api/v1';
  
  /// Connect timeout in seconds
  static const int connectTimeout = 30;
  
  /// Receive timeout in seconds
  static const int receiveTimeout = 30;
  
  /// API version
  static const String apiVersion = 'v1';
  
  /// Default headers
  static Map<String, String> get defaultHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}

