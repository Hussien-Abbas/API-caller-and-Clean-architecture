part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoded extends CharactersState {
  final List<Character> characters;

  CharactersLoded(this.characters);
}
