// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:chess/chess.dart';
import 'package:mek_data_class/mek_data_class.dart';

part 'exercice.g.dart';

const emptyCell = ' ';

String flattenSpaces(String input) {
  var buffer = "";
  var spacesCount = 0;
  final elements = input.split("");

  for (final e in elements) {
    final elementIsSpace = e == ' ';
    if (elementIsSpace) {
      spacesCount++;
    } else {
      if (spacesCount > 0) buffer += "$spacesCount";
      spacesCount = 0;
      buffer += e;
    }
  }
  if (spacesCount > 0) buffer += "$spacesCount";

  return buffer;
}

enum CompanionKingSide {
  noImportant,
  inShortSide,
  inLongSide,
}

enum CellFile {
  fileA('a'),
  fileB('b'),
  fileC('c'),
  fileD('d'),
  fileE('e'),
  fileF('f'),
  fileG('g'),
  fileH('h');

  const CellFile(this.repr);

  factory CellFile.fromAscii(String value) {
    return switch (value) {
      'a' => CellFile.fileA,
      'b' => CellFile.fileB,
      'c' => CellFile.fileC,
      'd' => CellFile.fileD,
      'e' => CellFile.fileE,
      'f' => CellFile.fileF,
      'g' => CellFile.fileG,
      'h' => CellFile.fileH,
      _ => throw "Unrecognized file value $value",
    };
  }

  final String repr;
}

enum CellRank {
  rank1('1'),
  rank2('2'),
  rank3('3'),
  rank4('4'),
  rank5('5'),
  rank6('6'),
  rank7('7'),
  rank8('8');

  const CellRank(this.repr);

  factory CellRank.fromAscii(String value) {
    return switch (value) {
      '1' => CellRank.rank1,
      '2' => CellRank.rank2,
      '3' => CellRank.rank3,
      '4' => CellRank.rank4,
      '5' => CellRank.rank5,
      '6' => CellRank.rank6,
      '7' => CellRank.rank7,
      '8' => CellRank.rank8,
      _ => throw "Unrecognized rank value $value",
    };
  }

  final String repr;
}

@DataClass()
class Cell with _$Cell {
  final CellFile file;
  final CellRank rank;

  Cell(this.file, this.rank);

  factory Cell.fromAscii(String cell) {
    return Cell(
      CellFile.fromAscii(cell.substring(0, 1)),
      CellRank.fromAscii(
        cell.substring(1, 2),
      ),
    );
  }

  String asciiValue() {
    return "${file.repr}${rank.repr}";
  }
}

@DataClass()
class EnemyPawnConfiguration with _$EnemyPawnConfiguration {
  final bool pawnSideHasWhite;
  final Cell cell;
  final CompanionKingSide companionKingSide;

  EnemyPawnConfiguration({
    required this.pawnSideHasWhite,
    required this.cell,
    required this.companionKingSide,
  });
}

final expectedCells = <EnemyPawnConfiguration, List<Cell>>{
  EnemyPawnConfiguration(
    pawnSideHasWhite: true,
    cell: Cell(CellFile.fileA, CellRank.rank7),
    companionKingSide: CompanionKingSide.noImportant,
  ): [
    Cell(CellFile.fileA, CellRank.rank8),
    Cell(CellFile.fileB, CellRank.rank8),
    Cell(CellFile.fileC, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileA, CellRank.rank7),
    Cell(CellFile.fileB, CellRank.rank7),
    Cell(CellFile.fileC, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileA, CellRank.rank6),
    Cell(CellFile.fileB, CellRank.rank6),
    Cell(CellFile.fileC, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileA, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
    Cell(CellFile.fileA, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
    pawnSideHasWhite: true,
    cell: Cell(CellFile.fileH, CellRank.rank7),
    companionKingSide: CompanionKingSide.noImportant,
  ): [
    Cell(CellFile.fileH, CellRank.rank8),
    Cell(CellFile.fileG, CellRank.rank8),
    Cell(CellFile.fileF, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileH, CellRank.rank7),
    Cell(CellFile.fileG, CellRank.rank7),
    Cell(CellFile.fileF, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileH, CellRank.rank6),
    Cell(CellFile.fileG, CellRank.rank6),
    Cell(CellFile.fileF, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileH, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
    Cell(CellFile.fileH, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
    pawnSideHasWhite: false,
    cell: Cell(CellFile.fileA, CellRank.rank2),
    companionKingSide: CompanionKingSide.noImportant,
  ): [
    Cell(CellFile.fileA, CellRank.rank1),
    Cell(CellFile.fileB, CellRank.rank1),
    Cell(CellFile.fileC, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileA, CellRank.rank2),
    Cell(CellFile.fileB, CellRank.rank2),
    Cell(CellFile.fileC, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileA, CellRank.rank3),
    Cell(CellFile.fileB, CellRank.rank3),
    Cell(CellFile.fileC, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileA, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
    Cell(CellFile.fileA, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
  ],
  EnemyPawnConfiguration(
    pawnSideHasWhite: false,
    cell: Cell(CellFile.fileH, CellRank.rank2),
    companionKingSide: CompanionKingSide.noImportant,
  ): [
    Cell(CellFile.fileH, CellRank.rank1),
    Cell(CellFile.fileG, CellRank.rank1),
    Cell(CellFile.fileF, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileH, CellRank.rank2),
    Cell(CellFile.fileG, CellRank.rank2),
    Cell(CellFile.fileF, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileH, CellRank.rank3),
    Cell(CellFile.fileG, CellRank.rank3),
    Cell(CellFile.fileF, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileH, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
    Cell(CellFile.fileH, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
  ],
  EnemyPawnConfiguration(
    pawnSideHasWhite: true,
    cell: Cell(CellFile.fileC, CellRank.rank7),
    companionKingSide: CompanionKingSide.inShortSide,
  ): [
    Cell(CellFile.fileA, CellRank.rank8),
    Cell(CellFile.fileB, CellRank.rank8),
    Cell(CellFile.fileC, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileA, CellRank.rank7),
    Cell(CellFile.fileB, CellRank.rank7),
    Cell(CellFile.fileC, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileA, CellRank.rank6),
    Cell(CellFile.fileB, CellRank.rank6),
    Cell(CellFile.fileC, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileA, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: true,
      cell: Cell(CellFile.fileF, CellRank.rank7),
      companionKingSide: CompanionKingSide.inShortSide): [
    Cell(CellFile.fileH, CellRank.rank8),
    Cell(CellFile.fileG, CellRank.rank8),
    Cell(CellFile.fileF, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileH, CellRank.rank7),
    Cell(CellFile.fileG, CellRank.rank7),
    Cell(CellFile.fileF, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileH, CellRank.rank6),
    Cell(CellFile.fileG, CellRank.rank6),
    Cell(CellFile.fileF, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileH, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: false,
      cell: Cell(CellFile.fileC, CellRank.rank2),
      companionKingSide: CompanionKingSide.inShortSide): [
    Cell(CellFile.fileA, CellRank.rank1),
    Cell(CellFile.fileB, CellRank.rank1),
    Cell(CellFile.fileC, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileA, CellRank.rank2),
    Cell(CellFile.fileB, CellRank.rank2),
    Cell(CellFile.fileC, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileA, CellRank.rank3),
    Cell(CellFile.fileB, CellRank.rank3),
    Cell(CellFile.fileC, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileA, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: false,
      cell: Cell(CellFile.fileF, CellRank.rank2),
      companionKingSide: CompanionKingSide.inShortSide): [
    Cell(CellFile.fileH, CellRank.rank1),
    Cell(CellFile.fileG, CellRank.rank1),
    Cell(CellFile.fileF, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileH, CellRank.rank2),
    Cell(CellFile.fileG, CellRank.rank2),
    Cell(CellFile.fileF, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileH, CellRank.rank3),
    Cell(CellFile.fileG, CellRank.rank3),
    Cell(CellFile.fileF, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileH, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: true,
      cell: Cell(CellFile.fileC, CellRank.rank7),
      companionKingSide: CompanionKingSide.inLongSide): [
    Cell(CellFile.fileA, CellRank.rank8),
    Cell(CellFile.fileB, CellRank.rank8),
    Cell(CellFile.fileC, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileF, CellRank.rank8),
    Cell(CellFile.fileG, CellRank.rank8),
    Cell(CellFile.fileA, CellRank.rank7),
    Cell(CellFile.fileB, CellRank.rank7),
    Cell(CellFile.fileC, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileF, CellRank.rank7),
    Cell(CellFile.fileG, CellRank.rank7),
    Cell(CellFile.fileA, CellRank.rank6),
    Cell(CellFile.fileB, CellRank.rank6),
    Cell(CellFile.fileC, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileF, CellRank.rank6),
    Cell(CellFile.fileG, CellRank.rank6),
    Cell(CellFile.fileA, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileA, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: true,
      cell: Cell(CellFile.fileF, CellRank.rank7),
      companionKingSide: CompanionKingSide.inLongSide): [
    Cell(CellFile.fileH, CellRank.rank8),
    Cell(CellFile.fileG, CellRank.rank8),
    Cell(CellFile.fileF, CellRank.rank8),
    Cell(CellFile.fileE, CellRank.rank8),
    Cell(CellFile.fileD, CellRank.rank8),
    Cell(CellFile.fileC, CellRank.rank8),
    Cell(CellFile.fileB, CellRank.rank8),
    Cell(CellFile.fileH, CellRank.rank7),
    Cell(CellFile.fileG, CellRank.rank7),
    Cell(CellFile.fileF, CellRank.rank7),
    Cell(CellFile.fileE, CellRank.rank7),
    Cell(CellFile.fileD, CellRank.rank7),
    Cell(CellFile.fileC, CellRank.rank7),
    Cell(CellFile.fileB, CellRank.rank7),
    Cell(CellFile.fileH, CellRank.rank6),
    Cell(CellFile.fileG, CellRank.rank6),
    Cell(CellFile.fileF, CellRank.rank6),
    Cell(CellFile.fileE, CellRank.rank6),
    Cell(CellFile.fileD, CellRank.rank6),
    Cell(CellFile.fileC, CellRank.rank6),
    Cell(CellFile.fileB, CellRank.rank6),
    Cell(CellFile.fileH, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileH, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: false,
      cell: Cell(CellFile.fileC, CellRank.rank2),
      companionKingSide: CompanionKingSide.inLongSide): [
    Cell(CellFile.fileA, CellRank.rank1),
    Cell(CellFile.fileB, CellRank.rank1),
    Cell(CellFile.fileC, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileF, CellRank.rank1),
    Cell(CellFile.fileG, CellRank.rank1),
    Cell(CellFile.fileA, CellRank.rank2),
    Cell(CellFile.fileB, CellRank.rank2),
    Cell(CellFile.fileC, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileF, CellRank.rank2),
    Cell(CellFile.fileG, CellRank.rank2),
    Cell(CellFile.fileA, CellRank.rank3),
    Cell(CellFile.fileB, CellRank.rank3),
    Cell(CellFile.fileC, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileF, CellRank.rank3),
    Cell(CellFile.fileG, CellRank.rank3),
    Cell(CellFile.fileA, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileA, CellRank.rank5),
    Cell(CellFile.fileB, CellRank.rank5),
    Cell(CellFile.fileC, CellRank.rank5),
    Cell(CellFile.fileD, CellRank.rank5),
  ],
  EnemyPawnConfiguration(
      pawnSideHasWhite: false,
      cell: Cell(CellFile.fileF, CellRank.rank2),
      companionKingSide: CompanionKingSide.inLongSide): [
    Cell(CellFile.fileH, CellRank.rank1),
    Cell(CellFile.fileG, CellRank.rank1),
    Cell(CellFile.fileF, CellRank.rank1),
    Cell(CellFile.fileE, CellRank.rank1),
    Cell(CellFile.fileD, CellRank.rank1),
    Cell(CellFile.fileC, CellRank.rank1),
    Cell(CellFile.fileB, CellRank.rank1),
    Cell(CellFile.fileH, CellRank.rank2),
    Cell(CellFile.fileG, CellRank.rank2),
    Cell(CellFile.fileF, CellRank.rank2),
    Cell(CellFile.fileE, CellRank.rank2),
    Cell(CellFile.fileD, CellRank.rank2),
    Cell(CellFile.fileC, CellRank.rank2),
    Cell(CellFile.fileB, CellRank.rank2),
    Cell(CellFile.fileH, CellRank.rank3),
    Cell(CellFile.fileG, CellRank.rank3),
    Cell(CellFile.fileF, CellRank.rank3),
    Cell(CellFile.fileE, CellRank.rank3),
    Cell(CellFile.fileD, CellRank.rank3),
    Cell(CellFile.fileC, CellRank.rank3),
    Cell(CellFile.fileB, CellRank.rank3),
    Cell(CellFile.fileH, CellRank.rank4),
    Cell(CellFile.fileG, CellRank.rank4),
    Cell(CellFile.fileF, CellRank.rank4),
    Cell(CellFile.fileE, CellRank.rank4),
    Cell(CellFile.fileD, CellRank.rank4),
    Cell(CellFile.fileC, CellRank.rank4),
    Cell(CellFile.fileB, CellRank.rank4),
    Cell(CellFile.fileH, CellRank.rank5),
    Cell(CellFile.fileG, CellRank.rank5),
    Cell(CellFile.fileF, CellRank.rank5),
    Cell(CellFile.fileE, CellRank.rank5),
  ],
};

extension CellsSerialisation on List<Cell> {
  String serializeCells() {
    return map((e) => e.asciiValue()).join("|");
  }
}

extension CellsDeserialisation on String {
  List<Cell> deserializeCells() {
    return isEmpty ? [] : split("|").map((e) => Cell.fromAscii(e)).toList();
  }
}

class SelectedCells {
  final List<Cell> values;

  SelectedCells({this.values = const []});

  String get serialized => values.serializeCells();

  SelectedCells toggleCell(Cell cell) {
    final newCellsValues = values;
    if (newCellsValues.contains(cell)) {
      newCellsValues.remove(cell);
    } else {
      newCellsValues.add(cell);
    }

    return SelectedCells(values: newCellsValues);
  }

  factory SelectedCells.fromSerialized(String repr) {
    return SelectedCells(values: repr.deserializeCells());
  }
}

extension ChessHelper on Chess {
  bool isOppositeKingAttacked() {
    final whiteTurn = turn == Color.WHITE;
    return king_attacked(whiteTurn ? Color.BLACK : Color.WHITE);
  }
}

extension PiecesArrayHelper on List<List<String>> {
  String toFen({required bool whiteTurn}) {
    final fenBase = map((line) => flattenSpaces(line.join(""))).join("/");
    return "$fenBase ${whiteTurn ? 'w' : 'b'} - - 0 1";
  }
}

class Exercice {
  final List<List<String>> pieces;
  final List<Cell> expectedCells;
  final bool pawnSideHasWhite;

  Exercice({
    required this.pieces,
    required this.expectedCells,
    required this.pawnSideHasWhite,
  });
}

Exercice generateExercice(void Function(double percent) onProgression) {
  onProgression(0.0);

  final random = Random();
  var pieces = List.generate(
    8,
    (e) => List.generate(
      8,
      (e) => emptyCell,
    ),
  );

  final pawnSideHasWhite = random.nextBool();

  bool checkPositionLegality() {
    final fen = pieces.toFen(whiteTurn: !pawnSideHasWhite);
    final chessLogic = Chess.fromFEN(fen);
    return chessLogic.generate_moves().isNotEmpty;
  }

  bool placePieceRandomly(String pieceType) {
    var isDone = false;
    final triedCells = <Cell>[];
    const tries = 70;

    for (int currentTry = 0; currentTry < tries; currentTry++) {
      final fileOrdinal = random.nextInt(8);
      final rankOrdinal = random.nextInt(8);

      final file = CellFile.values[fileOrdinal];
      final rank = CellRank.values[rankOrdinal];
      final cell = Cell(file, rank);

      if (triedCells.contains(cell)) continue;

      final isFree = pieces[7 - rankOrdinal][fileOrdinal] == emptyCell;
      if (isFree) {
        pieces[7 - rankOrdinal][fileOrdinal] = pieceType;
        final isLegal = checkPositionLegality();
        if (isLegal) {
          isDone = true;
          break;
        }
      }
      triedCells.add(cell);
    }

    return isDone;
  }

  // place ennemy pawn
  final enemyPawnRank = pawnSideHasWhite ? CellRank.rank7 : CellRank.rank2;
  final enemyPawnOnRookColumn = random.nextBool();

  Cell enemyPawnCell;
  if (enemyPawnOnRookColumn) {
    final enemyPawnOnFileA = random.nextBool();
    enemyPawnCell =
        Cell(enemyPawnOnFileA ? CellFile.fileA : CellFile.fileH, enemyPawnRank);
  } else {
    final enemyPawnOnFileC = random.nextBool();
    enemyPawnCell =
        Cell(enemyPawnOnFileC ? CellFile.fileC : CellFile.fileF, enemyPawnRank);
  }

  pieces[7 - enemyPawnCell.rank.index][enemyPawnCell.file.index] =
      pawnSideHasWhite ? 'P' : 'p';

  onProgression(1.0 / 5.0);

  // placing enemy king

  CellRank enemyKingRank;
  if (enemyPawnCell.rank == CellRank.rank2) {
    final kingOnFirstRank = random.nextBool();
    enemyKingRank = kingOnFirstRank ? CellRank.rank1 : CellRank.rank2;
  } else {
    final kingOnEightRank = random.nextBool();
    enemyKingRank = kingOnEightRank ? CellRank.rank8 : CellRank.rank7;
  }

  CellFile enemyKingFile;
  if (enemyPawnCell.file == CellFile.fileA) {
    enemyKingFile = CellFile.fileB;
  } else if (enemyPawnCell.file == CellFile.fileH) {
    enemyKingFile = CellFile.fileG;
  } else {
    final isLeftOfPawn = random.nextBool();
    final enemyKingFileOrdinal = isLeftOfPawn
        ? enemyPawnCell.file.index - 1
        : enemyPawnCell.file.index + 1;
    enemyKingFile = CellFile.values[enemyKingFileOrdinal];
  }

  pieces[7 - enemyKingRank.index][enemyKingFile.index] =
      pawnSideHasWhite ? 'K' : 'k';

  onProgression(2.0 / 5.0);

  bool success;

  // placing our king
  success = placePieceRandomly(pawnSideHasWhite ? 'k' : 'K');
  if (!success) throw "Failed to place your king.";
  onProgression(3.0 / 5.0);

  // placing our queen
  success = placePieceRandomly(pawnSideHasWhite ? 'q' : 'Q');
  if (!success) throw "Failed to place your queen.";
  onProgression(4.0 / 5.0);

  // getting the expected cells
  final companionKingSide = (enemyPawnCell.file == CellFile.fileA ||
          enemyPawnCell.file == CellFile.fileH)
      ? CompanionKingSide.noImportant
      : enemyPawnCell.file == CellFile.fileC
          ? (enemyKingFile.index < CellFile.fileC.index
              ? CompanionKingSide.inShortSide
              : CompanionKingSide.inLongSide)
          : (enemyKingFile.index < CellFile.fileF.index
              ? CompanionKingSide.inLongSide
              : CompanionKingSide.inShortSide);

  final config = EnemyPawnConfiguration(
    cell: enemyPawnCell,
    pawnSideHasWhite: pawnSideHasWhite,
    companionKingSide: companionKingSide,
  );

  final theExpectedCells = expectedCells[config];

  onProgression(1.0);

  if (theExpectedCells == null) throw "Could not get the expected cells.";

  return Exercice(
    pieces: pieces,
    expectedCells: theExpectedCells,
    pawnSideHasWhite: pawnSideHasWhite,
  );
}

class Solution {
  final List<Cell> correctCells;
  final List<Cell> wrongCells;
  final List<Cell> missedCells;

  Solution({
    required this.correctCells,
    required this.wrongCells,
    required this.missedCells,
  });
}

Solution solve(Exercice exercice, List<Cell> selectedCells) {
  final List<Cell> correctCells = [];
  final List<Cell> wrongCells = [];
  final List<Cell> missedCells = [];

  for (final rank in CellRank.values) {
    for (final CellFile file in CellFile.values) {
      final matchingCell = Cell(file, rank);

      final isCorrectCell = selectedCells.contains(matchingCell) &&
          exercice.expectedCells.contains(matchingCell);
      final isWrongCell = selectedCells.contains(matchingCell) &&
          !exercice.expectedCells.contains(matchingCell);
      final isMissedCell = !selectedCells.contains(matchingCell) &&
          exercice.expectedCells.contains(matchingCell);

      if (isCorrectCell) correctCells.add(matchingCell);
      if (isMissedCell) missedCells.add(matchingCell);
      if (isWrongCell) wrongCells.add(matchingCell);
    }
  }
  return Solution(
    correctCells: correctCells,
    wrongCells: wrongCells,
    missedCells: missedCells,
  );
}
