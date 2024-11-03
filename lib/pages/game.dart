import 'package:flutter/material.dart';
import 'package:queen_vs_pawn_winning_zone/i18n/strings.g.dart';
import 'package:simple_chess_board/models/short_move.dart';
import 'package:simple_chess_board/widgets/chessboard.dart';

class GamePageWidget extends StatefulWidget {
  const GamePageWidget({super.key});

  @override
  State<GamePageWidget> createState() => _GamePageWidgetState();
}

class _GamePageWidgetState extends State<GamePageWidget> {
  final Map<String, Color> _highlightedCells = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.pages.game.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SimpleChessBoard(
                  engineThinking: false,
                  fen: '8/8/8/4p1K1/2k1P3/8/8/8 b - - 0 1',
                  onMove: ({required ShortMove move}) {},
                  blackSideAtBottom: false,
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(t.pages.game.instruction),
            )
          ],
        ),
      ),
    );
  }
}
