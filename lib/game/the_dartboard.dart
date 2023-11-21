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
  double countdown = 30;
  late Timer timer;
  late int playerRounds;
  late int computerRounds;

  @override
  bool debugMode = true;

  init() {
    playerRounds = computerRounds = 0;
    turn = Turn.playerTurn;
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
    updateScore(turn);
    gameOver();
    nextTurn();
    super.update(dt);
  }

  nextTurn() {
    if (timerBar.countdown <= 0 || dartboard.throwTimes > 2) {
      if (turn == Turn.playerTurn) {
        playerScoreBoard.reset();
        turn = Turn.computerTurn;
        dartboard.turn = turn;
        dartboard.computerPlay();
        computerScore -= dartboard.totalScore();
      } else {
        computerScoreBoard.reset();
        turn = Turn.playerTurn;
        dartboard.turn = turn;
        playerScore -= dartboard.totalScore();
      }
      dartboard.reset();
      turnTextComponent.turn = turn;
      timerBar.resetTimer();
      print("PLAYER SCORE $playerScore");
    }
  }

  updateScore(turn) {
    if (turn == Turn.playerTurn) {
      playerScoreBoard.score = dartboard.scoreArray;
      playerScoreBoard.totalScore = playerScore - dartboard.totalScore();
    } else {
      computerScoreBoard.score = dartboard.scoreArray;
      computerScoreBoard.totalScore = computerScore - dartboard.totalScore();
    }
  }

  gameOver() {
    if (playerScore <= 0 || computerScore <= 0) {
      pauseEngine();
      overlays.add(GameOverMenu.id);
    }
  }

  void reset() {
    init();
    turn = Turn.playerTurn;
    playerScoreBoard.reset();
    computerScoreBoard.reset();
    dartboard.reset();
    timerBar.resetTimer();
  }
}
