import 'package:breakingbad_api/Constants/My_Colors.dart';
import 'package:breakingbad_api/Constants/Strings.dart';
import 'package:breakingbad_api/data/model/Character.dart';
import 'package:flutter/material.dart';

class Characteritem extends StatelessWidget {
  const Characteritem({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            CharacterDetailsScreen,
            arguments: character,
          );
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId,
            child: Container(
              height: 40,
              color: Colors.black54,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                character.name,
                style: TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          child: Container(
            color: MyColors.myGrey,
            child: character.img.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/loading.gif',
                    image: character.img,
                    fit: BoxFit.fill,
                  )
                : Image.asset('assets/images/Error.gif', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
