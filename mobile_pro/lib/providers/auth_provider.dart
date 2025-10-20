import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_api/zelus_api.dart';
import 'package:zelus_core/zelus_core.dart';

/// Auth state
class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Auth provider
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _loadStoredUser();
  }

  /// Load stored user on app start
  Future<void> _loadStoredUser() async {
    final userId = await StorageHelper.getString(AppConstants.keyUserId);
    if (userId != null) {
      try {
        final user = await _authService.getCurrentUser();
        state = state.copyWith(user: user);
      } catch (e) {
        // Clear invalid session
        await logout();
      }
    }
  }

  /// Login with email/phone
  Future<bool> login({
    String? email,
    String? phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _authService.login(
        email: email,
        phone: phone,
        password: password,
      );

      // Store user info
      await StorageHelper.setString(AppConstants.keyUserId, user.id);
      await StorageHelper.setString(AppConstants.keyUserRole, user.role.name);
      if (user.email.isNotEmpty) {
        await StorageHelper.setString(AppConstants.keyUserEmail, user.email);
      }

      state = state.copyWith(user: user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Logout
  Future<void> logout() async {
    await _authService.logout();
    await StorageHelper.remove(AppConstants.keyUserId);
    await StorageHelper.remove(AppConstants.keyUserRole);
    await StorageHelper.remove(AppConstants.keyAuthToken);
    state = const AuthState();
  }

  /// Check if user is stylist
  bool get isStylist => state.user?.role == UserRole.stylist;

  /// Check if user is salon owner
  bool get isSalonOwner => state.user?.role == UserRole.salonOwner;
}

/// API client provider
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

/// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  final client = ref.watch(apiClientProvider);
  return AuthService(client);
});

/// Auth state provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

