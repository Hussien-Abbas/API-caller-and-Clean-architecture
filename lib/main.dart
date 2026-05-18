import 'package:breakingbad_api/AppRouter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RickandMorty(appRouter: AppRouter()));
}

class RickandMorty extends StatelessWidget {
  final AppRouter appRouter;

  const RickandMorty({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generatedRoute,
    );
  }
}
