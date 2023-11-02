import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/screens/game_play.dart';
import 'package:the_dartboard/screens/settings_screen.dart';
import 'package:the_dartboard/widgets/commons/base_layout.dart';
import 'package:the_dartboard/widgets/commons/circle_stroke_button.dart';

// Represents the main menu screen of Spacescape, allowing
// players to start the game or modify in-game settings.
class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(PngAssets.logo),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleStrokeButton(
                onPressed: () {
                  // Push and replace current screen (i.e MainMenu) with
                  // SelectSpaceship(), so that player can select a spaceship.
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                child: Image.asset(PngAssets.settingsIcon),
              ),
              const SizedBox(
                width: 40,
              ),
              CircleStrokeButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const GamePlay(),
                    ),
                  );
                },
                child: Image.asset(PngAssets.playIcon),
              ),
              const SizedBox(
                width: 40,
              ),
              CircleStrokeButton(
                  onPressed: () {
                    // Push and replace current screen (i.e MainMenu) with
                    // SelectSpaceship(), so that player can select a spaceship.
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => const SelectSpaceship(),
                    //   ),
                    // );
                  },
                  child: Image.asset(PngAssets.statisticsIcon)),
            ],
          ),
        ],
      ),
    );
  }
}
