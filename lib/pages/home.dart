import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';
import 'package:queen_vs_pawn_winning_zone/pages/game.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.home.title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => _generateExerciceAndGoToGamePage(context),
            child: Text(t.pages.home.new_game)),
      ),
    );
  }

  void _generateExerciceAndGoToGamePage(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const GamePageWidget();
    }));
  }
}
