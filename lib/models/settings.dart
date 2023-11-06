import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Settings extends ChangeNotifier {
  Settings({bool bgm = false}) {
    _bgm = bgm;
  }
  var box = Hive.box('Settings');

  bool _bgm = false;
  bool get bgm => _bgm;
  set bgm(bool value) {
    _bgm = value;
    box.put("bgm", _bgm);
    notifyListeners();
  }
}
