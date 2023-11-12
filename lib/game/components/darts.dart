import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:the_dartboard/config/assets/assets.dart';

class Darts extends SpriteComponent with DragCallbacks {
  final Turn turn;
  final int throwTimes;
  Darts(
    this.turn,
    this.throwTimes, {
    required position,
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

  // @override
  // void onDragStart(DragStartEvent event) {
  //   super.onDragStart(event);
  //   priority = 10;
  // }

  // @override
  // void onDragEnd(DragEndEvent event) {
  //   super.onDragEnd(event);
  //   priority = 0;
  // }

  // @override
  // void onDragUpdate(DragUpdateEvent event) {
  //   position += event.delta;
  // }
}

enum Turn { playerTurn, computerTurn }

enum DartsType { short, medium, long }
