import 'package:breakingbad_api/Constants/Strings.dart';
import 'package:breakingbad_api/business%20logic/cubit/characters_cubit.dart';
import 'package:breakingbad_api/data/API/CharactersApi.dart';
import 'package:breakingbad_api/data/model/Character.dart';
import 'package:breakingbad_api/data/repository/Character_repo.dart';
import 'package:breakingbad_api/presentation/Screens/Characters_Details.dart';
import 'package:breakingbad_api/presentation/Screens/Characters_screen.dart';
import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepo characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepo(charactersApi: CharactersApi());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharacterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case CharacterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharactersDetails(character: character),
        );
      default:
        return null;
    }
  }
}
