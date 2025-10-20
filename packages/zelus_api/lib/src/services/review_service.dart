import '../clients/api_client.dart';
import '../models/review.dart';

/// Review Service
class ReviewService {
  final ApiClient _client;

  ReviewService(this._client);

  /// Get reviews for a stylist
  Future<List<Review>> getStylistReviews(String stylistId) async {
    final response = await _client.get('/pros/$stylistId/reviews');
    return (response.data as List)
        .map((json) => Review.fromJson(json))
        .toList();
  }

  /// Get reviews for a salon
  Future<List<Review>> getSalonReviews(String salonId) async {
    final response = await _client.get('/salons/$salonId/reviews');
    return (response.data as List)
        .map((json) => Review.fromJson(json))
        .toList();
  }

  /// Create a review
  Future<Review> createReview({
    required String customerId,
    String? stylistId,
    String? salonId,
    required double rating,
    required String comment,
    String? serviceName,
    List<String>? photos,
  }) async {
    final response = await _client.post('/reviews', data: {
      'customer_id': customerId,
      if (stylistId != null) 'stylist_id': stylistId,
      if (salonId != null) 'salon_id': salonId,
      'rating': rating,
      'comment': comment,
      if (serviceName != null) 'service_name': serviceName,
      if (photos != null) 'photos': photos,
    });

    return Review.fromJson(response.data);
  }

  /// Mark review as helpful
  Future<void> markHelpful(String reviewId) async {
    await _client.post('/reviews/$reviewId/helpful');
  }
}

