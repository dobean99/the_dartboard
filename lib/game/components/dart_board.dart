import 'dart:async';

import 'package:flame/components.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

class DartBoard extends SpriteComponent with HasGameRef<TheDartboard> {
  DartBoard({required Vector2? position}) : super(position: position);
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(PngAssets.dartBoard);
    anchor = Anchor.center;
  }
}
