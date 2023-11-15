import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/components/turn_text_component.dart';
import 'components/components.dart';

class TheDartboard extends FlameGame {
  // late SpriteComponent clock;
  late TimerBar timerBar;
  late ScoreBoard playerScoreBoard;
  late ScoreBoard computureScoreBoard;
  late TurnTextComponent turnTextComponent;
  late DartBoard dartboard;
  int playerScore = 500;
  int computerScore = 500;
  double countdown = 30;
  late Timer timer;

  @override
  bool debugMode = true;

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
    turnTextComponent = TurnTextComponent(
        turn: Turn.playerTurn, position: Vector2(size.x / 2, timerBar.y + 30));

    playerScoreBoard = ScoreBoard(
      turn: Turn.playerTurn,
      position: Vector2(size.x / 6, 150),
    );
    computureScoreBoard = ScoreBoard(
      turn: Turn.computerTurn,
      position: Vector2(size.x * 5 / 6, 150),
    );
    dartboard = DartBoard(position: Vector2(size.x / 2, size.y / 2 + 40));
    addAll([
      clock,
      timerBar,
      playerScoreBoard,
      computureScoreBoard,
      dartboard,
      turnTextComponent
    ]);
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
      if (isPlayerTurn()) {
        turnTextComponent.turn = Turn.playerTurn;
      } else {
        turnTextComponent.turn = Turn.computerTurn;
      }
      timerBar.resetTimer();
    }
  }

  bool isPlayerTurn() {
    return true;
  }

  void reset() {}
}
