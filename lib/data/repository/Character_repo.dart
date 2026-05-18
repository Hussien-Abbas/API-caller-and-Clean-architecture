// ignore_for_file: file_names, non_constant_identifier_names

import 'package:breakingbad_api/data/API/CharactersApi.dart';
import 'package:breakingbad_api/data/model/Character.dart';

class CharacterRepo {
  final CharactersApi charactersApi;

  CharacterRepo({required this.charactersApi});

  Future<List<Character>> getAllCharacters() async {
    final repoCharacters = await charactersApi.getAllCharacters();
    return repoCharacters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
