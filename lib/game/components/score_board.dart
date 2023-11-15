import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/components/darts.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class ScoreBoard extends SpriteComponent with HasGameRef<TheDartboard> {
  final Turn turn;
  late int totalScore = 500;
  final titleBoardText = TextComponent(
      text: '',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      anchor: Anchor.center);
  final pointBoardText = TextComponent(
      text: 'Points',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      anchor: Anchor.center);
  var score = [];
  final scoreFirstThrow = TextComponent(
    text: '',
    textRenderer: TextPaint(
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    anchor: Anchor.center,
  );
  final scoreSecondThrow = TextComponent(
    text: '',
    textRenderer: TextPaint(
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    anchor: Anchor.center,
  );
  final scoreThirdThrow = TextComponent(
    text: '',
    textRenderer: TextPaint(
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    anchor: Anchor.center,
  );
  ScoreBoard({required this.turn, required Vector2? position})
      : super(position: position);
  @override
  Future<void> onLoad() async {
    score = [20, 0, 0];
    sprite = await Sprite.load(PngAssets.scoreBoard);
    anchor = Anchor.topCenter;
  }

  @override
  void onMount() {
    titleBoardText.position = Vector2(size.x / 2, 45);
    pointBoardText.position = Vector2(size.x / 2, 130);
    scoreFirstThrow.text = score[0].toString();
    scoreFirstThrow.position = Vector2(size.x / 2 - 36, size.y / 2);
    scoreSecondThrow.text = score[1].toString();
    scoreSecondThrow.position = Vector2(size.x / 2, size.y / 2);
    scoreThirdThrow.text = score[2].toString();
    scoreThirdThrow.position = Vector2(size.x / 2 + 36, size.y / 2);
    addAll([
      titleBoardText,
      pointBoardText,
      scoreFirstThrow,
      scoreSecondThrow,
      scoreThirdThrow
    ]);
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (game.buildContext != null) {
      pointBoardText.text = "${game.buildContext!.l10n!.points} $totalScore";
      titleBoardText.text = _getText(turn);
    }
  }

  String _getText(Turn turn) {
    switch (turn) {
      case Turn.playerTurn:
        return game.buildContext!.l10n!.player;
      case Turn.computerTurn:
        return game.buildContext!.l10n!.computer;
    }
  }
}
