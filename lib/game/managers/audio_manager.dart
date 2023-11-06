import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AudioManager {
  AudioManager._internal();
  static final AudioManager _instance = AudioManager._internal();
  static AudioManager get instance => _instance;
  Future<void> init(List<String> files) async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll(files);
    _pref = await Hive.openBox('preferences');
    if (_pref.get('bgm') == null) {
      _pref.put('bgm', true);
    }
    _bgm = ValueNotifier(_pref.get('bgm'));
  }

  late Box _pref;
  late ValueNotifier<bool> _bgm;

  ValueNotifier<bool> get listenableBgm => _bgm;
  void setBgm(bool flag) {
    _pref.put('bgm', flag);
    _bgm.value = flag;
  }

  void startBgm(String fileName) {
    if (_bgm.value) {
      FlameAudio.bgm.play(fileName);
    }
  }

  void stopBgm() {
    if (_bgm.value) {
      FlameAudio.bgm.stop();
    }
  }
}
