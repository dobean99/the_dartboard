import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class TimerBar extends PositionComponent {
  final double timer;
  TimerBar(
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
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(-2, 5, timer, 20),
      Paint()..color = AppColors.timerBarColor,
    );

    super.render(canvas);
  }
}
