import '../clients/api_client.dart';
import '../models/salon.dart';

/// Salon Service
class SalonService {
  final ApiClient _client;

  SalonService(this._client);

  /// Get list of salons
  Future<List<Salon>> getSalons({
    String? city,
    String? service,
    double? minRating,
  }) async {
    final response = await _client.get('/salons', queryParameters: {
      if (city != null) 'city': city,
      if (service != null) 'service': service,
      if (minRating != null) 'min_rating': minRating,
    });

    // Handle both direct array and wrapped response
    final salonsData = response.data is Map && response.data.containsKey('salons')
        ? response.data['salons']
        : response.data;

    return (salonsData as List)
        .map((json) => Salon.fromJson(json))
        .toList();
  }

  /// Get salon by ID
  Future<Salon> getSalonById(String id) async {
    final response = await _client.get('/salons/$id');
    return Salon.fromJson(response.data);
  }

  /// Update salon (for owners)
  Future<Salon> updateSalon(String id, Map<String, dynamic> data) async {
    final response = await _client.put('/salons/$id', data: data);
    return Salon.fromJson(response.data);
  }

  /// Get salon staff
  Future<List<dynamic>> getSalonStaff(String salonId) async {
    final response = await _client.get('/salons/$salonId/staff');
    return response.data as List;
  }

  /// Get salon analytics (for owners)
  Future<Map<String, dynamic>> getSalonAnalytics(String salonId) async {
    final response = await _client.get('/salons/$salonId/analytics');
    return response.data;
  }
}

