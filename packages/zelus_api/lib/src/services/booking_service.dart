import '../clients/api_client.dart';
import '../models/booking.dart';

/// Booking Service
class BookingService {
  final ApiClient _client;

  BookingService(this._client);

  /// Create a new booking
  Future<Booking> createBooking({
    required String customerId,
    required String stylistId,
    String? salonId,
    required String serviceId,
    required DateTime bookingDate,
    required String startTime,
    required String endTime,
    required double price,
    String? notes,
  }) async {
    final response = await _client.post('/bookings', data: {
      'customer_id': customerId,
      'stylist_id': stylistId,
      if (salonId != null) 'salon_id': salonId,
      'service_id': serviceId,
      'booking_date': bookingDate.toIso8601String(),
      'start_time': startTime,
      'end_time': endTime,
      'price': price,
      if (notes != null) 'notes': notes,
    });

    return Booking.fromJson(response.data);
  }

  /// Get bookings for a stylist (Pro app use)
  Future<List<Booking>> getMyBookings({
    BookingStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final response = await _client.get('/pros/bookings', queryParameters: {
      if (status != null) 'status': status.name,
      if (startDate != null) 'start_date': startDate.toIso8601String(),
      if (endDate != null) 'end_date': endDate.toIso8601String(),
    });

    return (response.data as List)
        .map((json) => Booking.fromJson(json))
        .toList();
  }

  /// Get customer bookings (Consumer app use)
  Future<List<Booking>> getCustomerBookings(String customerId) async {
    final response = await _client.get('/customers/$customerId/bookings');

    return (response.data as List)
        .map((json) => Booking.fromJson(json))
        .toList();
  }

  /// Get booking by ID
  Future<Booking> getBookingById(String id) async {
    final response = await _client.get('/bookings/$id');
    return Booking.fromJson(response.data);
  }

  /// Update booking status (for stylists)
  Future<Booking> updateBookingStatus(
    String bookingId,
    BookingStatus status, {
    String? cancellationReason,
  }) async {
    final response = await _client.put('/bookings/$bookingId/status', data: {
      'status': status.name,
      if (cancellationReason != null) 'cancellation_reason': cancellationReason,
    });

    return Booking.fromJson(response.data);
  }

  /// Set availability slots (for stylists)
  Future<void> setAvailability({
    required DateTime date,
    required List<Map<String, String>> timeSlots,
  }) async {
    await _client.post('/pros/availability', data: {
      'date': date.toIso8601String(),
      'time_slots': timeSlots,
    });
  }

  /// Get available slots for a stylist
  Future<List<String>> getAvailableSlots({
    required String stylistId,
    required DateTime date,
  }) async {
    final response = await _client.get('/pros/$stylistId/availability', queryParameters: {
      'date': date.toIso8601String(),
    });

    return (response.data['slots'] as List).cast<String>();
  }
}

