import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/character_model.dart';

class ApiService {
  final String apiUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<Result>> fetchCharacters() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> resultsList = data['results'];

      return resultsList.map((model) => Result.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
