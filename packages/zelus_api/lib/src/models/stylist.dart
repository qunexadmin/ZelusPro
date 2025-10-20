import 'package:freezed_annotation/freezed_annotation.dart';

part 'stylist.freezed.dart';
part 'stylist.g.dart';

/// Stylist/Professional Profile Model
/// Represents a beauty professional (stylist, makeup artist, etc.)
@freezed
class Stylist with _$Stylist {
  const factory Stylist({
    required String id,
    required String name,
    @JsonKey(name: 'profile_image_url') String? photoUrl,
    required String bio,
    @Default([]) List<String> specialties,
    @JsonKey(name: 'base_price') double? priceRange,
    @Default([]) List<String> languages,
    @Default(0.0) double rating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @JsonKey(name: 'portfolio_images') @Default([]) List<String> portfolio,
    @JsonKey(name: 'salon_id') String? salonId,
    @JsonKey(name: 'salon_name') String? salonName,
    String? location,
    @JsonKey(name: 'booking_url') String? bookingUrl,
    @JsonKey(fromJson: _servicesFromJson) @Default([]) List<String> services,
    @JsonKey(name: 'years_experience') @Default(0) int yearsExperience,
    @Default(0) int followerCount,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Stylist;

  factory Stylist.fromJson(Map<String, dynamic> json) =>
      _$StylistFromJson(json);
}

/// Convert services array from API (array of objects) to array of strings
List<String> _servicesFromJson(dynamic services) {
  if (services == null) return [];
  if (services is List) {
    return services.map((service) {
      if (service is Map<String, dynamic>) {
        return service['name']?.toString() ?? '';
      }
      return service.toString();
    }).where((s) => s.isNotEmpty).toList();
  }
  return [];
}

