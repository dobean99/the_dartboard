import 'dart:async';

import 'package:flame/components.dart';
import 'package:the_dartboard/config/assets/assets.dart';

class Darts extends SpriteComponent {
  final Turn turn;
  final int throwTimes;
  Darts(
    this.turn,
    this.throwTimes, {
    required position,
    required sprite,
  }) : super(position: position);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(getDartsColor(turn, throwTimes));
  }

  String getDartsColor(Turn turn, int throwTimes) {
    if (turn == Turn.playerTurn) {
      return getBlueDartsSprite(throwTimes);
    } else {
      return getYellowDartsSprite(throwTimes);
    }
  }

  String getBlueDartsSprite(int throwTimes) {
    switch (throwTimes) {
      case 1:
        return PngAssets.shortBlueDarts;
      case 2:
        return PngAssets.mediumBlueDarts;
      case 3:
        return PngAssets.longBlueDarts;
      default:
        return PngAssets.shortBlueDarts;
    }
  }

  String getYellowDartsSprite(int throwTimes) {
    switch (throwTimes) {
      case 1:
        return PngAssets.shortYellowDarts;
      case 2:
        return PngAssets.mediumYellowDarts;
      case 3:
        return PngAssets.longYellowDarts;
      default:
        return PngAssets.shortYellowDarts;
    }
  }
}

enum Turn { playerTurn, computerTurn }

enum DartsType { short, medium, long }
