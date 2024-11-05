import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';
import 'package:queen_vs_pawn_winning_zone/logic/exercice.dart';
import 'package:queen_vs_pawn_winning_zone/pages/home.dart';
import 'package:simple_chess_board/models/piece_type.dart';
import 'package:simple_chess_board/models/short_move.dart';
import 'package:simple_chess_board/widgets/chessboard.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SolutionPageWidget extends StatelessWidget {
  final Solution solutionData;
  final Exercice exercice;

  const SolutionPageWidget({
    super.key,
    required this.solutionData,
    required this.exercice,
  });

  Map<String, Color> getCellHighlights() {
    var data = <String, Color>{};
    for (final solution in solutionData.correctCells) {
      data[solution.asciiValue()] = Colors.lightGreen;
    }
    for (final solution in solutionData.wrongCells) {
      data[solution.asciiValue()] = Colors.redAccent;
    }
    for (final solution in solutionData.missedCells) {
      data[solution.asciiValue()] = Colors.grey;
    }

    return data;
  }

  void _returnToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) {
        return const HomePageWidget();
      }),
    );
  }

  void _showLegend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(t.pages.solution.see_legend),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: LegendItem(
                      color: Colors.lightGreen,
                      caption: t.pages.solution.correct_cell,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: LegendItem(
                      color: Colors.redAccent,
                      caption: t.pages.solution.wrong_cell,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: LegendItem(
                      color: Colors.grey,
                      caption: t.pages.solution.missed_cell,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  t.common.buttons.close,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimpleChessBoard(
                fen: exercice.pieces
                    .toFen(whiteTurn: !exercice.pawnSideHasWhite),
                whitePlayerType: PlayerType.computer,
                blackPlayerType: PlayerType.computer,
                onMove: ({required ShortMove move}) {},
                onPromote: () => Future.value(null),
                onPromotionCommited: ({
                  required ShortMove moveDone,
                  required PieceType pieceType,
                }) {},
                onTap: ({required String cellCoordinate}) {},
                chessBoardColors: ChessBoardColors(),
                cellHighlights: getCellHighlights(),
              ).animate().fadeIn(duration: 500.ms).scale(duration: 500.ms),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _returnToHomePage(context),
              child: Text(
                t.pages.solution.back_to_home,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _showLegend(context),
              child: Text(
                t.pages.solution.see_legend,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String caption;

  const LegendItem({
    super.key,
    required this.color,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final squareSize = MediaQuery.of(context).size.shortestSide * 0.1;

    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: squareSize,
            height: squareSize,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(caption),
        ),
      ],
    ));
  }
}
