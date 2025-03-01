import '../models/country.dart';
import '../../core/constants/api_constants.dart';
import '../../core/utils/http_client.dart';

class CountriesRepository {
  final HttpClient _httpClient;

  CountriesRepository({HttpClient? httpClient})
      : _httpClient = httpClient ?? HttpClient();

  Future<List<Country>> getAfricanCountries() async {
    try {
      final dynamic response = await _httpClient.get(
        ApiConstants.africaRegionEndpoint,
        queryParameters: ApiConstants.defaultFields,
      );

      if (response is! List) {
        throw Exception('Invalid response format: expected a List');
      }

      return List<Country>.from(
        response.map(
          (dynamic item) => Country.fromJson(item as Map<String, dynamic>),
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch countries: $e');
    }
  }

  Future<Country> getCountryByName(String name) async {
    try {
      final dynamic response = await _httpClient.get(
        ApiConstants.getCountryByName(name),
        queryParameters: ApiConstants.defaultFields,
      );

      if (response is! List || response.isEmpty) {
        throw Exception('Country not found');
      }

      final countryData = response.first;
      if (countryData is! Map<String, dynamic>) {
        throw Exception('Invalid country data format');
      }

      return Country.fromJson(countryData);
    } catch (e) {
      throw Exception('Failed to fetch country details: $e');
    }
  }

  void dispose() {
    _httpClient.dispose();
  }
}
