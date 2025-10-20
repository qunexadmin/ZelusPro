/// Input validation utilities
class Validators {
  /// Validate email address
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validate phone number (basic validation)
  static bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate password strength
  /// At least 8 characters, 1 uppercase, 1 lowercase, 1 number
  static bool isValidPassword(String password) {
    if (password.length < 8) return false;
    
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    
    return hasUppercase && hasLowercase && hasNumber;
  }

  /// Get password strength message
  static String getPasswordStrengthMessage(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'At least 8 characters required';
    if (!password.contains(RegExp(r'[A-Z]'))) return 'Add an uppercase letter';
    if (!password.contains(RegExp(r'[a-z]'))) return 'Add a lowercase letter';
    if (!password.contains(RegExp(r'[0-9]'))) return 'Add a number';
    return 'Strong password';
  }

  /// Validate rating (1.0 to 5.0)
  static bool isValidRating(double rating) {
    return rating >= 1.0 && rating <= 5.0;
  }

  /// Validate price (must be positive)
  static bool isValidPrice(double price) {
    return price > 0;
  }

  /// Validate URL
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Check if string is not empty
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Check if list is not empty
  static bool isListNotEmpty(List? list) {
    return list != null && list.isNotEmpty;
  }
}

