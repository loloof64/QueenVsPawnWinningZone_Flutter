import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';
import 'package:queen_vs_pawn_winning_zone/logic/exercice.dart';
import 'package:queen_vs_pawn_winning_zone/pages/solution.dart';
import 'package:simple_chess_board/models/short_move.dart';
import 'package:simple_chess_board/widgets/chessboard.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GamePageWidget extends StatefulWidget {
  final Exercice exercice;

  const GamePageWidget({
    super.key,
    required this.exercice,
  });

  @override
  State<GamePageWidget> createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  final Map<String, Color> _highlightedCells = {};
  var _boardReversed = false;

  _toggleBoardOrientation() {
    setState(() {
      _boardReversed = !_boardReversed;
    });
  }

  _validate() {
    final highlightedCells =
        _highlightedCells.keys.map((cell) => Cell.fromAscii(cell)).toList();
    final solution = solve(widget.exercice, highlightedCells);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) {
        return SolutionPageWidget(
          solutionData: solution,
          exercice: widget.exercice,
        );
      }),
    );
  }

  _showHelp(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(t.pages.game.help_title),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(t.pages.game.help_sentence_1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(t.pages.game.help_sentence_2),
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
      appBar: AppBar(
        title: Text(t.pages.game.title),
        actions: [
          IconButton(
            onPressed: _toggleBoardOrientation,
            icon: const FaIcon(FontAwesomeIcons.upDown),
          ),
          IconButton(
            onPressed: () => _showHelp(context),
            icon: const FaIcon(
              FontAwesomeIcons.question,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SimpleChessBoard(
                  engineThinking: false,
                  fen: widget.exercice.pieces
                      .toFen(whiteTurn: !widget.exercice.pawnSideHasWhite),
                  onMove: ({required ShortMove move}) {},
                  blackSideAtBottom: _boardReversed,
                  whitePlayerType: PlayerType.computer,
                  blackPlayerType: PlayerType.computer,
                  lastMoveToHighlight: null,
                  onPromote: () => Future.value(null),
                  onPromotionCommited:
                      ({required moveDone, required pieceType}) => {},
                  chessBoardColors: ChessBoardColors(),
                  cellHighlights: _highlightedCells,
                  onTap: ({required cellCoordinate}) {
                    if (_highlightedCells[cellCoordinate] == null) {
                      _highlightedCells[cellCoordinate] = Colors.lightGreen;
                      setState(() {});
                    } else {
                      _highlightedCells.remove(cellCoordinate);
                      setState(() {});
                    }
                  },
                ).animate().fadeIn(duration: 500.ms).scale(duration: 500.ms),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(t.pages.game.instruction),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _validate,
                child: Text(
                  t.pages.game.validate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
