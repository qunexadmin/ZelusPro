import '../clients/api_client.dart';
import '../models/user.dart';

/// Authentication Service
class AuthService {
  final ApiClient _client;

  AuthService(this._client);

  /// Login with email/phone and password
  Future<User> login({
    String? email,
    String? phone,
    required String password,
  }) async {
    final response = await _client.post('/auth/login', data: {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      'password': password,
    });

    // Store the auth token
    if (response.data['token'] != null) {
      _client.setAuthToken(response.data['token']);
    }

    return User.fromJson(response.data['user']);
  }

  /// Register a new user
  Future<User> register({
    required String email,
    String? phone,
    required String name,
    required String password,
    required UserRole role,
  }) async {
    final response = await _client.post('/auth/register', data: {
      'email': email,
      if (phone != null) 'phone': phone,
      'name': name,
      'password': password,
      'role': role.name,
    });

    // Store the auth token
    if (response.data['token'] != null) {
      _client.setAuthToken(response.data['token']);
    }

    return User.fromJson(response.data['user']);
  }

  /// Logout
  Future<void> logout() async {
    _client.clearAuthToken();
    // Optional: call logout endpoint if backend implements it
    // await _client.post('/auth/logout');
  }

  /// Get current user profile
  Future<User> getCurrentUser() async {
    final response = await _client.get('/auth/me');
    return User.fromJson(response.data);
  }

  /// Refresh auth token
  Future<String> refreshToken(String refreshToken) async {
    final response = await _client.post('/auth/refresh', data: {
      'refresh_token': refreshToken,
    });
    final newToken = response.data['token'];
    _client.setAuthToken(newToken);
    return newToken;
  }
}

