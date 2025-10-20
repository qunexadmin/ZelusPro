/// Feature flags for controlling app features
class FeatureFlags {
  // Authentication
  static const bool enableFirebaseAuth = false;
  static const bool enableMockAuth = true;
  
  // Social Features
  static const bool enableFollowing = true;
  static const bool enableMessaging = true;
  static const bool enableActivityFeed = true;
  
  // Booking
  static const bool enableInAppBooking = false; // Currently uses external URLs
  static const bool enablePayments = false;
  static const bool enableTipping = false;
  
  // AI Features
  static const bool enableAIAssistant = true;
  static const bool enableAIStylePreview = false;
  static const bool enableAIRecommendations = true;
  
  // Professional Features
  static const bool enablePortfolioUpload = true;
  static const bool enableVideoUpload = false;
  static const bool enableLiveStreaming = false;
  
  // Business Features (Pro App)
  static const bool enableCalendar = true;
  static const bool enableClientManagement = true;
  static const bool enableAnalytics = true;
  static const bool enableStaffManagement = true;
  
  // Retail
  static const bool enableRetailDiscovery = true;
  static const bool enablePriceTracking = true;
  
  // Other
  static const bool enablePushNotifications = false;
  static const bool enableVideoConsultations = false;
  static const bool enableDarkMode = true;
}

