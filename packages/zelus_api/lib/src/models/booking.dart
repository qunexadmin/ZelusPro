import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

/// Booking status
enum BookingStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('no_show')
  noShow,
}

/// Booking Model
/// Represents a service booking/appointment
@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'customer_email') String? customerEmail,
    @JsonKey(name: 'stylist_id') required String stylistId,
    @JsonKey(name: 'stylist_name') String? stylistName,
    @JsonKey(name: 'salon_id') String? salonId,
    @JsonKey(name: 'salon_name') String? salonName,
    @JsonKey(name: 'service_id') required String serviceId,
    @JsonKey(name: 'service_name') String? serviceName,
    @JsonKey(name: 'booking_date') required DateTime bookingDate,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @Default(BookingStatus.pending) BookingStatus status,
    required double price,
    String? notes,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

