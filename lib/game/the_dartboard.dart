import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:the_dartboard/config/config.dart';
import 'package:the_dartboard/widgets/overlays/game_over_menu.dart';
import 'components/components.dart';

class TheDartboard extends FlameGame {
  late TimerBar timerBar;
  late ScoreBoard playerScoreBoard;
  late ScoreBoard computerScoreBoard;
  late TurnTextComponent turnTextComponent;
  late DartBoard dartboard;
  late Turn currentTurn;
  late int playerScore;
  late int computerScore;
  late Timer timer;
  late int playerRounds;
  late int computerRounds;
  late AudioPlayerComponent _audioPlayerComponent;

  @override
  bool debugMode = false;

  init() {
    playerRounds = computerRounds = 0;
    currentTurn = Turn.playerTurn;
    playerScore = computerScore = 500;
  }

  @override
  Future<void> onLoad() async {
    init();
    _audioPlayerComponent = AudioPlayerComponent();
    timerBar = TimerBar(
      position: Vector2(size.x / 2 - 150, 10),
      anchor: Anchor.center,
    );
    final clockIcon = await Sprite.load(PngAssets.clockIcon);
    SpriteComponent clock = SpriteComponent(
        sprite: clockIcon, position: Vector2(timerBar.position.x - 50, 10));
    turnTextComponent = TurnTextComponent(
        turn: currentTurn, position: Vector2(size.x / 2, timerBar.y + 30));

    playerScoreBoard = ScoreBoard(
      turn: Turn.playerTurn,
      position: Vector2(size.x / 6, 150),
    );
    computerScoreBoard = ScoreBoard(
      turn: Turn.computerTurn,
      position: Vector2(size.x * 5 / 6, 150),
    );
    dartboard = DartBoard(
        position: Vector2(size.x / 2, size.y / 2 + 40), turn: currentTurn);
    addAll([
      _audioPlayerComponent,
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
  void onAttach() {
    _audioPlayerComponent.playBgm(AudioAssets.bgAudio);
    super.onAttach();
  }

  @override
  void update(double dt) {
    gameOver();
    updateScore(currentTurn);
    nextTurn();
    super.update(dt);
  }

  nextTurn() async {
    if (timerBar.countdown <= 0 || dartboard.throwTimes > 2) {
      if (currentTurn == Turn.playerTurn) {
        playerScoreBoard.reset();
        currentTurn = Turn.computerTurn;
        dartboard.turn = currentTurn;
        dartboard.resetTurn();
        dartboard.isEnable = false;
      } else {
        computerScoreBoard.reset();
        currentTurn = Turn.playerTurn;
        dartboard.turn = currentTurn;
        dartboard.resetTurn();
        dartboard.isEnable = true;
      }
      turnTextComponent.turn = currentTurn;
      if (currentTurn == Turn.computerTurn) {
        await dartboard.computerPlay();
      }
      timerBar.resetTimer();
    }
  }

  updateScore(turn) {
    if (turn == Turn.playerTurn) {
      playerScoreBoard.score = dartboard.scoreArray;
      playerScoreBoard.totalScore = dartboard.playerScore;
      playerScore = dartboard.playerScore;
      if (dartboard.playerScore < 0) {
        playerScoreBoard.totalScore = playerScore = 0;
      }
    } else {
      computerScoreBoard.score = dartboard.scoreArray;
      computerScoreBoard.totalScore = dartboard.computerScore;
      computerScore = dartboard.computerScore;
      if (dartboard.computerScore < 0) {
        computerScoreBoard.totalScore = computerScore = 0;
      }
    }
    playerRounds = dartboard.playerRounds;
    computerRounds = dartboard.computerRounds;
  }

  gameOver() {
    if (playerScore <= 0 || computerScore <= 0) {
      pauseEngine();
      overlays.add(GameOverMenu.id);
    }
  }

  void reset() {
    init();
    turnTextComponent.turn = currentTurn;
    playerScoreBoard.resetGame();
    computerScoreBoard.resetGame();
    dartboard.resetGame();
    children.whereType<Darts>().forEach((darts) {
      darts.removeFromParent();
    });
    timerBar.reset();
  }

  @override
  void onDetach() {
    _audioPlayerComponent.stopBgm();
    super.onDetach();
  }
}
