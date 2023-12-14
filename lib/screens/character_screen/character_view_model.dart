import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/repository/character_repository.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharacterRepository _repository;

  CharacterViewModel(this._repository);

  List<Result> results = [];

  Future<List<Result>> getCharacters() async {
    try {
      results = await _repository.getCharacters();
      for (var result in results) {
        print('Name: ${result.name}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return results;
  }
}
