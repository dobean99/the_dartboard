import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class TimerBarComponent extends PositionComponent {
  final double timer;
  static const widthTimerBar = 180.0;
  static const heightTimerBar = 20.0;

  static final Paint white = BasicPalette.white.paint();
  static final Paint blue = BasicPalette.blue.paint()
    ..strokeWidth = 10
    ..color = AppColors.bgButtonColor;
  TimerBarComponent(
      {super.position,
      super.size,
      super.scale,
      super.angle,
      super.nativeAngle,
      super.anchor,
      super.children,
      super.priority,
      super.key,
      required this.timer});
  @override
  Future<void> onLoad() async {
    final clock = await Sprite.load(PngAssets.clockIcon);
    SpriteComponent sprite = SpriteComponent()..sprite = clock;
    RectangleComponent background = RectangleComponent(
        size: Vector2(widthTimerBar, heightTimerBar),
        paint: Paint()..color = AppColors.timerBarColor);

    addAll([sprite, background]);
  }

  // @override
  // void render(Canvas canvas) {
  //   canvas.drawRect(
  //     Rect.fromLTWH(-2, 5, timer, 20),
  //     Paint()..color = AppColors.timerBarColor,
  //   );
  //   super.render(canvas);
  // }
}
