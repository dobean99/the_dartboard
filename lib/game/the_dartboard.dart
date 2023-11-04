import 'dart:async';
import 'package:flame/game.dart';
import 'package:the_dartboard/game/components/timer_bar_component.dart';

class TheDartboard extends FlameGame {
  late TimerBarComponent timerBar;
  @override
  Future<void> onLoad() async {
    timerBar =
        TimerBarComponent(timer: 200, position: Vector2(size.x / 2, 100));
    add(timerBar);
    return super.onLoad();
  }

  void reset() {}
}
