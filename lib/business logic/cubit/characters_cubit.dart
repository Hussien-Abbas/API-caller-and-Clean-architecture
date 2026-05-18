import 'package:bloc/bloc.dart';
import 'package:breakingbad_api/data/model/Character.dart';
import 'package:breakingbad_api/data/repository/Character_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
  List<Character> characters = [];

  CharactersCubit(this.characterRepo) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    final repoCharacters = await characterRepo.getAllCharacters();
    emit(CharactersLoded(repoCharacters));
    characters = repoCharacters;
  }
}
