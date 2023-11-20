import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Score extends ChangeNotifier {
  static const String scoresBox = 'scoreBox';
  static const String scoresData = 'scoresData';
  @HiveField(0)
  late int totalRounds;
  @HiveField(1)
  late int totalPlayerWin;

  Score({required this.totalRounds, required this.totalPlayerWin});
}
