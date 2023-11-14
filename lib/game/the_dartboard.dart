import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:the_dartboard/config/assets/audio_assets.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/managers/audio_manager.dart';
import 'components/components.dart';

class TheDartboard extends FlameGame {
  // late SpriteComponent clock;
  late TimerBar timerBar;
  late ScoreBoard playerScoreBoard;
  late ScoreBoard computureScoreBoard;
  late DartBoard dartboard;
  int playerScore = 500;
  int computerScore = 500;
  double countdown = 30;
  late Timer timer;

  // @override
  // bool debugMode = true;

  @override
  Future<void> onLoad() async {
    // AudioManager.instance.startBgm(AudioAssets.bgAudio);
    timerBar = TimerBar(
      position: Vector2(size.x / 2 - 150, 10),
      anchor: Anchor.center,
    );
    final clockIcon = await Sprite.load(PngAssets.clockIcon);
    SpriteComponent clock = SpriteComponent(
        sprite: clockIcon, position: Vector2(timerBar.position.x - 50, 10));

    playerScoreBoard = ScoreBoard(
      turn: Turn.playerTurn,
      position: Vector2(size.x / 6, 150),
    );

    computureScoreBoard = ScoreBoard(
      turn: Turn.computerTurn,
      position: Vector2(size.x * 5 / 6, 150),
    );
    dartboard = DartBoard(position: Vector2(size.x / 2, size.y / 2 + 40));
    addAll([clock, timerBar, playerScoreBoard, computureScoreBoard, dartboard]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    nextTurn();
    super.update(dt);
  }

  nextTurn() {
    if (timerBar.countdown <= 0) {
      print("NEXT TURN");
      timerBar.resetTimer();
    }
  }

  void reset() {}
}
