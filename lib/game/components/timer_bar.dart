import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';

class TimerBar extends PositionComponent {
  TimerBar({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.nativeAngle,
    super.anchor,
    super.children,
    super.priority,
    super.key,
  }) {
    timer = Timer(1, onTick: () {
      timerCountdown();
    }, repeat: true);
    timer.start();
  }

  double countdown = 30;
  late Timer timer;

  @override
  void update(double dt) {
    timer.update(dt);
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(-2, 5, countdown * 10, 20),
        Paint()
          ..color = AppColors.timerBarColor
          ..style = PaintingStyle.fill);
    canvas.drawRect(
      const Rect.fromLTWH(-2, 5, 300, 20),
      Paint()
        ..color = AppColors.whiteColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0,
    );

    super.render(canvas);
  }

  resetTimer() {
    countdown = 30;
    timer.reset();
    timer.start();
  }

  reset() {
    countdown = 30;
    timer.reset();
  }

  timerCountdown() {
    countdown -= 1;
    if (countdown <= 0) {
      timer.stop();
    }
  }
}
