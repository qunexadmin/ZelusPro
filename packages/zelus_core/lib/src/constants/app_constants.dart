/// Application constants shared across Zelus apps
class AppConstants {
  // API
  static const String apiBaseUrl = 'http://3.24.31.8:8006/api/v1';
  static const String apiVersion = 'v1';
  
  // Storage Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserRole = 'user_role';
  static const String keyUserEmail = 'user_email';
  
  // Timeouts
  static const int defaultTimeout = 30; // seconds
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Rating
  static const double minRating = 1.0;
  static const double maxRating = 5.0;
  
  // Booking
  static const int minBookingDays = 1; // Can book starting tomorrow
  static const int maxBookingDays = 90; // Can book up to 3 months ahead
  
  // Images
  static const int maxPortfolioImages = 20;
  static const int maxReviewImages = 5;
  static const int maxImageSizeMB = 10;
  
  // Currency
  static const String currencySymbol = '\$';
  static const String currencyCode = 'USD';
}

