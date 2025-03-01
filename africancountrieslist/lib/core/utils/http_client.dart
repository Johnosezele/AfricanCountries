import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client _client;

  HttpClient({http.Client? client}) : _client = client ?? http.Client();

  Future<dynamic> get(String url, {Map<String, String>? queryParameters}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);
      final response = await _client.get(uri);
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
