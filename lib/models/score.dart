import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'score.g.dart';

@HiveType(typeId: 0)
class Score extends ChangeNotifier with HiveObjectMixin {
  static const String scoresBox = 'scoreBox';
  static const String scoresData = 'scoresData';
  @HiveField(0)
  late int totalRounds;
  @HiveField(1)
  late int totalPlayerWin;

  Score({required this.totalRounds, required this.totalPlayerWin});

  updateScore(int playerScore, int computerScore) {
    totalRounds += 1;
    if (playerScore < computerScore) {
      totalPlayerWin += 1;
    }
    notifyListeners();
    save();
  }
}
