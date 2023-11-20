import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Settings extends ChangeNotifier {
  static const String settingsKey = 'Settings';
  Settings({bool bgm = false}) {
    _bgm = bgm;
  }
  var box = Hive.box(settingsKey);

  bool _bgm = false;
  bool get bgm => _bgm;
  set bgm(bool value) {
    _bgm = value;
    box.put("bgm", _bgm);
    notifyListeners();
  }
}
