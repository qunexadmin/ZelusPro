import '../clients/api_client.dart';
import '../models/stylist.dart';
import '../models/service.dart';

/// Stylist Service
class StylistService {
  final ApiClient _client;

  StylistService(this._client);

  /// Get list of stylists
  Future<List<Stylist>> getStylists({
    String? city,
    String? specialty,
    double? minRating,
  }) async {
    final response = await _client.get('/pros', queryParameters: {
      if (city != null) 'city': city,
      if (specialty != null) 'specialty': specialty,
      if (minRating != null) 'min_rating': minRating,
    });

    return (response.data as List)
        .map((json) => Stylist.fromJson(json))
        .toList();
  }

  /// Get stylist by ID
  Future<Stylist> getStylistById(String id) async {
    final response = await _client.get('/pros/$id');
    return Stylist.fromJson(response.data);
  }

  /// Get current stylist's own profile
  Future<Stylist> getMyProfile() async {
    final response = await _client.get('/pros/me');
    return Stylist.fromJson(response.data);
  }

  /// Update stylist profile
  Future<Stylist> updateProfile(String id, Map<String, dynamic> data) async {
    final response = await _client.put('/pros/$id', data: data);
    return Stylist.fromJson(response.data);
  }

  /// Get stylist services
  Future<List<Service>> getStylistServices(String stylistId) async {
    final response = await _client.get('/pros/$stylistId/services');
    return (response.data as List)
        .map((json) => Service.fromJson(json))
        .toList();
  }

  /// Upload portfolio image
  Future<String> uploadPortfolioImage(String stylistId, dynamic imageData) async {
    final response = await _client.post(
      '/pros/$stylistId/portfolio',
      data: imageData,
    );
    return response.data['url'];
  }

  /// Delete portfolio image
  Future<void> deletePortfolioImage(String stylistId, String imageUrl) async {
    await _client.delete('/pros/$stylistId/portfolio', data: {
      'image_url': imageUrl,
    });
  }
}

