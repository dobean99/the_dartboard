import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/components/turn_text_component.dart';
import 'package:the_dartboard/widgets/overlays/game_over_menu.dart';
import 'components/components.dart';

class TheDartboard extends FlameGame {
  late TimerBar timerBar;
  late ScoreBoard playerScoreBoard;
  late ScoreBoard computerScoreBoard;
  late TurnTextComponent turnTextComponent;
  late DartBoard dartboard;
  late Turn turn;
  late int playerScore;
  late int computerScore;
  late int throwTimes;
  double countdown = 30;
  late Timer timer;

  @override
  bool debugMode = true;

  init() {
    turn = Turn.playerTurn;
    throwTimes = 0;
    playerScore = computerScore = 500;
  }

  @override
  Future<void> onLoad() async {
    init();
    print("Onload");
    // AudioManager.instance.startBgm(AudioAssets.bgAudio);
    timerBar = TimerBar(
      position: Vector2(size.x / 2 - 150, 10),
      anchor: Anchor.center,
    );
    final clockIcon = await Sprite.load(PngAssets.clockIcon);
    SpriteComponent clock = SpriteComponent(
        sprite: clockIcon, position: Vector2(timerBar.position.x - 50, 10));
    turnTextComponent = TurnTextComponent(
        turn: turn, position: Vector2(size.x / 2, timerBar.y + 30));

    playerScoreBoard = ScoreBoard(
      turn: Turn.playerTurn,
      position: Vector2(size.x / 6, 150),
    );
    computerScoreBoard = ScoreBoard(
      turn: Turn.computerTurn,
      position: Vector2(size.x * 5 / 6, 150),
    );
    dartboard =
        DartBoard(position: Vector2(size.x / 2, size.y / 2 + 40), turn: turn);
    addAll([
      clock,
      timerBar,
      playerScoreBoard,
      computerScoreBoard,
      dartboard,
      turnTextComponent
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    nextTurn();
    // if (dartboard.start) {
    //   updateScore(turn);
    // }
    gameOver();
    super.update(dt);
  }

  nextTurn() {
    if (timerBar.countdown <= 0 || dartboard.throwTimes > 2) {
      if (turn == Turn.playerTurn) {
        turnTextComponent.turn = Turn.playerTurn;
        dartboard.interactive = false;
        playerScoreBoard.reset();
        turn = Turn.computerTurn;
      } else {
        turnTextComponent.turn = Turn.computerTurn;
        dartboard.interactive = true;
        computerScoreBoard.reset();
        turn = Turn.playerTurn;
      }

      dartboard.turn = turn;
      turnTextComponent.turn = turn;
      dartboard.reset();
      timerBar.resetTimer();
    }
  }

  updateScore(turn) {
    if (turn == Turn.playerTurn) {
      print("UPDATE CODE: ${dartboard.scoreArray[dartboard.throwTimes]}");
      playerScoreBoard.score[dartboard.throwTimes] =
          dartboard.scoreArray[dartboard.throwTimes];
    } else {
      computerScoreBoard.score[dartboard.throwTimes] =
          dartboard.scoreArray[dartboard.throwTimes];
    }
  }

  onDartsThrows() {}

  calculatePoint() {
    // playerScore -=;
  }

  gameOver() {
    if (playerScore <= 0 || computerScore <= 0) {
      overlays.add(GameOverMenu.id);
    }
  }

  void reset() {}
}
