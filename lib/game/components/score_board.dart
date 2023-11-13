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
  ScoreBoard({required this.turn, required Vector2? position})
      : super(position: position);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(PngAssets.scoreBoard);
    anchor = Anchor.topCenter;
  }

  @override
  void onMount() {
    titleBoardText.position = Vector2(size.x / 2, 45);
    pointBoardText.position = Vector2(size.x / 2, 130);
    addAll([titleBoardText, pointBoardText]);
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (game.buildContext != null) {
      pointBoardText.text = game.buildContext!.l10n!.points;
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
