// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercice.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

mixin _$Cell {
  Cell get _self => this as Cell;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cell &&
          runtimeType == other.runtimeType &&
          _self.file == other.file &&
          _self.rank == other.rank;
  @override
  int get hashCode {
    var hashCode = 0;
    hashCode = $hashCombine(hashCode, _self.file.hashCode);
    hashCode = $hashCombine(hashCode, _self.rank.hashCode);
    return $hashFinish(hashCode);
  }

  @override
  String toString() => (ClassToString('Cell')
        ..add('file', _self.file)
        ..add('rank', _self.rank))
      .toString();
}

mixin _$EnemyPawnConfiguration {
  EnemyPawnConfiguration get _self => this as EnemyPawnConfiguration;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnemyPawnConfiguration &&
          runtimeType == other.runtimeType &&
          _self.pawnSideHasWhite == other.pawnSideHasWhite &&
          _self.cell == other.cell &&
          _self.companionKingSide == other.companionKingSide;
  @override
  int get hashCode {
    var hashCode = 0;
    hashCode = $hashCombine(hashCode, _self.pawnSideHasWhite.hashCode);
    hashCode = $hashCombine(hashCode, _self.cell.hashCode);
    hashCode = $hashCombine(hashCode, _self.companionKingSide.hashCode);
    return $hashFinish(hashCode);
  }

  @override
  String toString() => (ClassToString('EnemyPawnConfiguration')
        ..add('pawnSideHasWhite', _self.pawnSideHasWhite)
        ..add('cell', _self.cell)
        ..add('companionKingSide', _self.companionKingSide))
      .toString();
}
