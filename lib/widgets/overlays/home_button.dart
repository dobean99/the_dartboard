import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/the_dartboard.dart';
import 'package:the_dartboard/screens/main_menu.dart';
import 'package:the_dartboard/widgets/commons/circle_stroke_button.dart';

class HomeButton extends StatelessWidget {
  static const String id = 'HomeButton';
  final TheDartboard game;
  final bool isBottom;
  final VoidCallback? onPressed;

  const HomeButton(
      {Key? key, required this.game, this.isBottom = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBottom ? Alignment.bottomRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: CircleStrokeButton(
            width: 54,
            child: Image.asset(PngAssets.homeIcon),
            onPressed: onPressed ??
                () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MainMenu(),
                  ));
                }),
      ),
    );
  }
}
