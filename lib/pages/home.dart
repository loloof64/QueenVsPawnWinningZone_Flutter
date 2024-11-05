import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';
import 'package:queen_vs_pawn_winning_zone/logic/exercice.dart';
import 'package:queen_vs_pawn_winning_zone/pages/game.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  var _progression = 0.0;
  var _showProgression = false;
  var _generationFailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.home.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _generateExerciceAndGoToGamePage(context),
                child: Text(t.pages.home.new_game),
              ),
            ),
            if (_showProgression)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  value: _progression,
                ),
              ),
            if (_generationFailed)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.pages.home.generation_error,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _generateExerciceAndGoToGamePage(BuildContext ctx) {
    _progression = 0.0;
    _showProgression = true;
    _generationFailed = false;

    try {
      final exercice = generateExercice(
        (progression) => setState(() {
          _progression = progression;
        }),
      );

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return GamePageWidget(
          exercice: exercice,
        );
      }));
    } catch (ex) {
      _generationFailed = true;
      _progression = 0.0;
      _showProgression = false;
      debugPrint(ex as String);
    }
  }
}
