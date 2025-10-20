import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

/// Review Model
/// Represents a customer review for a stylist or salon
@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_photo') String? customerPhoto,
    @JsonKey(name: 'stylist_id') String? stylistId,
    @JsonKey(name: 'salon_id') String? salonId,
    required double rating,
    required String comment,
    @JsonKey(name: 'service_name') String? serviceName,
    @Default([]) List<String> photos,
    @JsonKey(name: 'helpful_count') @Default(0) int helpfulCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);
}

