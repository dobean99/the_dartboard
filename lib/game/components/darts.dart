import 'dart:async';
import 'package:flame/components.dart';
import 'package:the_dartboard/config/assets/assets.dart';

class Darts extends SpriteComponent {
  final Turn turn;
  final int throwTimes;
  Darts(
    this.turn,
    this.throwTimes, {
    required Vector2? position,
  }) : super(position: position, anchor: Anchor.topCenter);
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
      case 0:
        return PngAssets.shortBlueDarts;
      case 1:
        return PngAssets.mediumBlueDarts;
      case 2:
        return PngAssets.longBlueDarts;
      default:
        return PngAssets.shortBlueDarts;
    }
  }

  String getYellowDartsSprite(int throwTimes) {
    switch (throwTimes) {
      case 0:
        return PngAssets.shortYellowDarts;
      case 1:
        return PngAssets.mediumYellowDarts;
      case 2:
        return PngAssets.longYellowDarts;
      default:
        return PngAssets.shortYellowDarts;
    }
  }
}

enum Turn { playerTurn, computerTurn }

enum DartsType { short, medium, long }
