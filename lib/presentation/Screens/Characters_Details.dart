import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breakingbad_api/Constants/My_Colors.dart';
import 'package:breakingbad_api/data/model/Character.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharactersDetails extends StatelessWidget {
  const CharactersDetails({super.key, required this.character});

  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: GoogleFonts.roboto(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.img, fit: BoxFit.fill),
        ),
      ),
    );
  }

  Widget characterinfos(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "  $value",
            style: GoogleFonts.roboto(color: MyColors.myWhite, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double value) {
    return Divider(
      color: MyColors.myYellow,
      height: 20,
      thickness: 3,
      radius: BorderRadius.circular(10),
      endIndent: value,
    );
  }

  Widget containerOfInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          characterinfos('Name:', character.name),
          buildDivider(282),
          characterinfos('Status:', character.status),
          buildDivider(280),
          characterinfos('Spices:', character.spiecies),
          buildDivider(278),
          characterinfos('Gender:', character.gender),
          buildDivider(275),
          characterinfos('Location:', character.location['name'] ?? 'Unknown'),
          buildDivider(260),
          SizedBox(
            width: 300.0,
            child: DefaultTextStyle(
              style: GoogleFonts.playwriteEsDeco(
                fontSize: 30.0,
                color: MyColors.myYellow,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 3500),
                animatedTexts: [
                  TypewriterAnimatedText('Nobody exists on purpose'),
                  TypewriterAnimatedText('Nobody belongs anywhere'),
                  TypewriterAnimatedText('Everybody\'s gonna die'),
                  TypewriterAnimatedText('Come watch TV'),
                ],
              ),
            ),
          ),
          SizedBox(height: 390),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate([containerOfInfo()])),
        ],
      ),
    );
  }
}
