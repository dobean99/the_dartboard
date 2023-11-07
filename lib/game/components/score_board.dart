import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class ScoreBoard extends SpriteComponent with HasGameRef<TheDartboard> {
  final String text;
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
  ScoreBoard({required this.text, required Vector2? position})
      : super(position: position) {
    titleBoardText.text = text.toUpperCase();
  }
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
}
