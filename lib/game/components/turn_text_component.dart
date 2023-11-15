import 'package:flame/components.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/game/components/components.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class TurnTextComponent extends TextComponent with HasGameRef<TheDartboard> {
  late Turn turn;

  TurnTextComponent(
      {super.text,
      super.textRenderer,
      super.position,
      super.size,
      super.scale,
      super.angle,
      super.anchor = Anchor.topCenter,
      super.children,
      super.priority,
      super.key,
      required this.turn});
  @override
  void update(double dt) {
    super.update(dt);
    if (game.buildContext != null) {
      text = _getText(turn);
    }
  }

  String _getText(Turn turn) {
    switch (turn) {
      case Turn.playerTurn:
        return game.buildContext!.l10n!.youTurn;
      case Turn.computerTurn:
        return game.buildContext!.l10n!.computerIsPlaying;
    }
  }
}
