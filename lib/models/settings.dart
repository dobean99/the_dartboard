import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 2)
class Settings extends ChangeNotifier with HiveObjectMixin {
  static const String settingsBox = 'SettingsBox';
  static const String settingsKey = 'Settings';
  Settings({bool bgm = false}) {
    _bgm = bgm;
  }
  @HiveField(0)
  bool _bgm = false;
  bool get bgm => _bgm;
  set bgm(bool value) {
    _bgm = value;
    notifyListeners();
    save();
  }
}
