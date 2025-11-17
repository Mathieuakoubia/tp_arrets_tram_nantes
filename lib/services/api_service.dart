import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/arret.dart';

class ApiService {
  static const String _baseUrl = 'https://data.nantesmetropole.fr';
  static const String _path = '/api/explore/v2.1/catalog/datasets/244400404_tan-arrets/records';

  Future<List<Arret>> fetchArrets() async {
    final response = await http.get(Uri.parse('$_baseUrl$_path?limit=20'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      return results.map((json) => Arret.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load arrets');
    }
  }
}
