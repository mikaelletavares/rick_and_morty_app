import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/service/api_service.dart';

class CharacterRepository {
  final ApiService _service;

  CharacterRepository(this._service);

  Future<List<Result>> getCharacters() => _service.fetchCharacters();
}
