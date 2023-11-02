import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/game/the_dartboard.dart';

TheDartboard _theDartboard = TheDartboard();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        // GameWidget is useful to inject the underlying
        // widget of any class extending from Flame's Game class.
        child: GameWidget(
          backgroundBuilder: (context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    PngAssets.backgroundImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Center(
              //   child: Text(
              //     context.l10n!.appName.toUpperCase(),
              //     style: const TextStyle(
              //         color: Color(
              //           0xFFFFA91F,
              //         ),
              //         fontSize: 50),
              //   ),
              // ),
            );
          },
          game: _theDartboard,
          // Initially only pause button overlay will be visible.
          // initialActiveOverlays: const [PauseButton.id],
          // overlayBuilderMap: {
          //   PauseButton.id: (BuildContext context, SpacescapeGame game) =>
          //       PauseButton(
          //         game: game,
          //       ),
          //   PauseMenu.id: (BuildContext context, SpacescapeGame game) =>
          //       PauseMenu(
          //         game: game,
          //       ),
          //   GameOverMenu.id: (BuildContext context, SpacescapeGame game) =>
          //       GameOverMenu(
          //         game: game,
          //       ),
          // },
        ),
      ),
    );
  }
}
