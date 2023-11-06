import 'dart:async';
import 'package:flame/game.dart';
import 'package:the_dartboard/config/assets/audio_assets.dart';
import 'package:the_dartboard/game/components/timer_bar_component.dart';
import 'package:the_dartboard/game/managers/audio_manager.dart';

class TheDartboard extends FlameGame {
  late TimerBarComponent timerBar;
  @override
  Future<void> onLoad() async {
    AudioManager.instance.startBgm(AudioAssets.bgAudio);
    timerBar =
        TimerBarComponent(timer: 200, position: Vector2(size.x / 2, 100));
    add(timerBar);
    return super.onLoad();
  }

  void reset() {}
  @override
  void onDetach() {
    AudioManager.instance.stopBgm();
  }
}
