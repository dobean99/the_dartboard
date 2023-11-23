import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/components/components.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class DartBoard extends SpriteComponent
    with HasGameRef<TheDartboard>, DragCallbacks {
  Turn turn;
  DartBoard({required this.turn, required Vector2? position})
      : super(position: position);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(PngAssets.dartBoard);
    anchor = Anchor.center;
  }

  late int throwTimes = 0;
  late Darts darts;
  late List<Darts> dartsArray = [];
  late List<int> scoreArray = [0, 0, 0];
  late bool isEnable = true;
  int playerScore = 500;
  int computerScore = 500;
  int playerRounds = 0;
  int computerRounds = 0;

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
      if (i % 2 == 0) {
        paint.color = outerColor;
      } else {
        paint.color = innerColor;
      }
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

  double calculateDistance(Vector2 position) {
    double centerX = x;
    double centerY = y - 5;
    double distance = sqrt((position.x - centerX) * (position.x - centerX) +
        (position.y - centerY) * (position.y - centerY));
    return distance;
  }

  int calculateScore(double dartX, double dartY) {
    double centerX = x;
    double centerY = y - 5;
    double distance = sqrt((dartX - centerX) * (dartX - centerX) +
        (dartY - centerY) * (dartY - centerY));
    double angle = atan2(dartY - centerY, dartX - centerX);

    angle = degrees(-angle);

    if (angle < 0) {
      angle += 360;
    }
    int score = 0;

    if (9 <= angle && angle <= 27) {
      score = 13;
    } else if (27 <= angle && angle <= 45) {
      score = 4;
    } else if (45 <= angle && angle <= 63) {
      score = 18;
    } else if (63 <= angle && angle <= 81) {
      score = 1;
    } else if (81 <= angle && angle <= 99) {
      score = 20;
    } else if (99 <= angle && angle <= 117) {
      score = 5;
    } else if (117 <= angle && angle <= 135) {
      score = 12;
    } else if (135 <= angle && angle <= 153) {
      score = 9;
    } else if (153 <= angle && angle <= 171) {
      score = 14;
    } else if (171 <= angle && angle <= 189) {
      score = 11;
    } else if (189 <= angle && angle <= 207) {
      score = 8;
    } else if (207 <= angle && angle <= 225) {
      score = 16;
    } else if (225 <= angle && angle <= 243) {
      score = 7;
    } else if (243 <= angle && angle <= 261) {
      score = 19;
    } else if (261 <= angle && angle <= 279) {
      score = 3;
    } else if (279 <= angle && angle <= 297) {
      score = 17;
    } else if (297 <= angle && angle <= 315) {
      score = 2;
    } else if (315 <= angle && angle <= 333) {
      score = 15;
    } else if (333 <= angle && angle <= 351) {
      score = 10;
    } else if (351 <= angle || angle <= 9) {
      score = 6;
    } else {
      score = 0;
    }

    if (distance <= 5) {
      score = 50;
    } else if (distance <= 10) {
      score = 25;
    } else if (distance <= 48) {
    } else if (48 <= distance && distance <= 53) {
      score *= 3;
    } else if (79 <= distance && distance <= 84) {
      score *= 2;
    } else if (distance <= 84) {
    } else {
      score = 0;
    }

    // print(
    //     " x:$dartX, y:$dartY, angle:$angle, Distance: $distance, Score: $score ");

    return score;
  }

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    if (isEnable) {
      darts = Darts(turn, throwTimes, position: event.canvasPosition);
      game.add(darts);
    }
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    if (isEnable) {
      if (calculateDistance(darts.position) > size.x / 2) {
        darts.removeFromParent();
      } else {
        darts.position += event.delta;
      }
    }
  }

  @override
  Future<void> onDragEnd(DragEndEvent event) async {
    super.onDragEnd(event);
    if (isEnable) {
      if (!darts.isRemoved) {
        int score = calculateScore(darts.x, darts.y);
        scoreArray[throwTimes] = score;
        playerScore -= score;
        dartsArray.add(darts);
        if (throwTimes >= 2) {
          isEnable = false;
          await Future.delayed(const Duration(seconds: 3));
          isEnable = true;
        }
        playerRounds += 1;
        throwTimes += 1;
      }
    }
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    super.onDragCancel(event);
    dartsArray[throwTimes].removeFromParent();
    dartsArray.removeAt(throwTimes);
  }

  Future<void> computerPlay() async {
    while (throwTimes <= 2 && turn == Turn.computerTurn) {
      double positionX =
          (Random().nextDouble() * size.x / 2) + (position.x - size.x / 4);
      double positionY =
          (Random().nextDouble() * size.y / 2) + (position.y - size.y / 4);
      darts = Darts(turn, throwTimes, position: Vector2(positionX, positionY));
      game.add(darts);
      int score = calculateScore(darts.x, darts.y);
      scoreArray[throwTimes] = score;
      computerScore -= score;
      dartsArray.add(darts);
      await Future.delayed(const Duration(seconds: 3));
      computerRounds += 1;
      throwTimes += 1;
    }
  }

  resetTurn() {
    for (var element in dartsArray) {
      element.removeFromParent();
    }
    throwTimes = 0;
    dartsArray = [];
    scoreArray = [0, 0, 0];
  }

  resetGame() {
    playerScore = computerScore = 500;
    playerRounds = computerRounds = 0;
    turn = Turn.playerTurn;
    isEnable = true;
    resetTurn();
  }
}
