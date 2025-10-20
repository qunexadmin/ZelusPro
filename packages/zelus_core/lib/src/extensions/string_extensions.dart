/// String extension methods
extension StringExtensions on String {
  /// Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Title case (capitalize each word)
  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  /// Check if string is email
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Check if string is phone number
  bool get isPhone {
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    return phoneRegex.hasMatch(this);
  }

  /// Check if string is URL
  bool get isUrl {
    try {
      final uri = Uri.parse(this);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Truncate string with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Remove all whitespace
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Format phone number: "(123) 456-7890"
  String formatPhone() {
    final digits = removeWhitespace().replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    }
    return this;
  }

  /// Convert to currency: "$123.45"
  String toCurrency({String symbol = '\$'}) {
    final number = double.tryParse(this);
    if (number == null) return this;
    return '$symbol${number.toStringAsFixed(2)}';
  }
}

