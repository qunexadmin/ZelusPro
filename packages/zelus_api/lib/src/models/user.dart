import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User roles in the system
enum UserRole {
  @JsonValue('customer')
  customer,
  @JsonValue('stylist')
  stylist,
  @JsonValue('salon_owner')
  salonOwner,
}

/// User Model
/// Represents any user in the system (customer, stylist, or salon owner)
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? phone,
    required String name,
    @JsonKey(name: 'profile_image_url') String? photoUrl,
    @Default(UserRole.customer) UserRole role,
    @JsonKey(name: 'stylist_id') String? stylistId,
    @JsonKey(name: 'salon_id') String? salonId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'last_login') DateTime? lastLogin,
    @Default(false) bool isVerified,
    @Default(false) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

