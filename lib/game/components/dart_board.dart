import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class DartBoard extends SpriteComponent with HasGameRef<TheDartboard> {
  DartBoard({required Vector2? position}) : super(position: position);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(PngAssets.dartBoard);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    paintDartBoard(canvas, Size.fromRadius(size.x / 2));
    super.render(canvas);
  }

  void paintDartBoard(Canvas canvas, Size size) {
    const outerColor = AppColors.blackColor;
    const innerColor = AppColors.whiteColor;
    const double radius = 100;

    final paint = Paint()
      ..color = outerColor
      ..strokeWidth = 2;

    // Draw the outer circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);

    // Draw the inner circle
    paint.color = innerColor;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), radius * 0.75, paint);

    // Draw the wedges
    for (int i = 0; i < 20; i++) {
      final startAngle = 2 * pi * i / 20;
      final endAngle = 2 * pi * (i + 1) / 20;

      canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height),
        startAngle,
        endAngle,
        true,
        paint,
      );
    }

    // Draw the bullseye
    paint.color = AppColors.howlingPink;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), radius * 0.25, paint);
  }
}
