import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

/// Service Model
/// Represents a service offered by a stylist or salon
@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String name,
    required String description,
    required double price,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    @JsonKey(name: 'stylist_id') String? stylistId,
    @JsonKey(name: 'salon_id') String? salonId,
    String? category,
    @JsonKey(name: 'image_url') String? imageUrl,
    @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

