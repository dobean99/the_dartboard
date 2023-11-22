import 'package:flame_audio/flame_audio.dart';
import '../../models/settings.dart';

class AudioManager {
  late Settings settings;
  AudioManager._internal();
  static final AudioManager _instance = AudioManager._internal();
  static AudioManager get instance => _instance;
  Future<void> init(List<String> files, Settings settings) async {
    this.settings = settings;
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll(files);
  }

  void startBgm(String fileName) {
    if (settings.bgm) {
      FlameAudio.bgm.play(fileName, volume: 0.4);
    }
  }

  void stopBgm() {
    if (!settings.bgm) {
      FlameAudio.bgm.stop();
    }
  }
}
