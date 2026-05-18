import 'package:breakingbad_api/Constants/My_Colors.dart';
import 'package:breakingbad_api/business%20logic/cubit/characters_cubit.dart';
import 'package:breakingbad_api/data/model/Character.dart';
import 'package:breakingbad_api/presentation/Widgets/characterItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_fonts/google_fonts.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters = [];
  late List<Character> searchedCharacters = [];
  final _searchedtextcontroler = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget searchfield() {
    return TextField(
      controller: _searchedtextcontroler,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Write a name",
        helperStyle: TextStyle(color: MyColors.myWhite, fontSize: 18),
        border: InputBorder.none,
      ),
      style: TextStyle(color: MyColors.myWhite, fontSize: 18),
      onChanged: (searchedname) {
        addcharactertosearchedlist(searchedname);
      },
    );
  }

  void addcharactertosearchedlist(String searchedname) {
    searchedCharacters = allCharacters
        .where(
          (character) => character.name.toLowerCase().startsWith(searchedname),
        )
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch;
            Navigator.pop(context);
          },

          icon: Icon(Icons.clear),
        ),
      ];
    } else {
      return [IconButton(onPressed: _startSearch, icon: Icon(Icons.search))];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _clearSearch;
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchedtextcontroler.clear();
    });
  }

  Widget buildBlockBuilder() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoded) {
          allCharacters = state.characters;
          return buildLodedListWidget();
        } else {
          return showCircularProgressIndicator();
        }
      },
    );
  }

  Widget showCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  Widget buildLodedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(children: [buildGridVewWidget()]),
      ),
    );
  }

  Widget buildGridVewWidget() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: _searchedtextcontroler.text.isEmpty
          ? allCharacters.length
          : searchedCharacters.length,
      itemBuilder: (context, index) {
        // TO DO
        return Characteritem(
          character: _searchedtextcontroler.text.isEmpty
              ? allCharacters[index]
              : searchedCharacters[index],
        );
      },
    );
  }

  Widget buildNormlAppBar() {
    return Text(
      "Characters",
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
    );
  }

  Widget noConnection() {
    return Center(
      child: Container(
        color: MyColors.myWhite,
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('noConnection.png', width: 350, height: 300),
            Text(
              "You're offline",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: MyColors.myGrey,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? searchfield() : buildNormlAppBar(),
        actions: buildAppBarAction(),
        leading: _isSearching
            ? BackButton(color: MyColors.myGrey)
            : Container(),
      ),

      body: OfflineBuilder(
        connectivityBuilder:
            (
              BuildContext context,
              List<ConnectivityResult> connectivity,
              Widget child,
            ) {
              final bool connected = !connectivity.contains(
                ConnectivityResult.none,
              );
              if (connected) {
                return buildBlockBuilder();
              } else {
                return noConnection();
              }
            },
        child: showCircularProgressIndicator(),
      ),
    );
  }
}
