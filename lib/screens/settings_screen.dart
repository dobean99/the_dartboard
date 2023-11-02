import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/screens/main_menu.dart';
import 'package:the_dartboard/widgets/commons/base_layout.dart';
import 'package:the_dartboard/widgets/commons/circle_stroke_button.dart';
import 'package:the_dartboard/widgets/commons/title_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              TitleScreen(
                text: context.l10n!.settings,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleStrokeButton(
                    width: 84,
                    onPressed: () {},
                    child: Image.asset(PngAssets.volumeIcon),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CircleStrokeButton(
                    width: 84,
                    onPressed: () {},
                    child: Image.asset(PngAssets.musicIcon),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CircleStrokeButton(
                    onPressed: () {},
                    width: 84,
                    child: Image.asset(PngAssets.usaIcon),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0, right: 30),
              child: CircleStrokeButton(
                width: 54,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MainMenu(),
                  ));
                },
                child: Image.asset(PngAssets.homeIcon),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [

          //     // Game title.

          //     // Switch for sound effects.
          //     // Selector<Settings, bool>(
          //     //   selector: (context, settings) => settings.soundEffects,
          //     //   builder: (context, value, child) {
          //     //     return SwitchListTile(
          //     //       title: const Text('Sound Effects'),
          //     //       value: value,
          //     //       onChanged: (newValue) {
          //     //         Provider.of<Settings>(context, listen: false).soundEffects =
          //     //             newValue;
          //     //       },
          //     //     );
          //     //   },
          //     // ),

          //     // Switch for background music.
          //     // Selector<Settings, bool>(
          //     //   selector: (context, settings) => settings.backgroundMusic,
          //     //   builder: (context, value, child) {
          //     //     return SwitchListTile(
          //     //       title: const Text('Background Music'),
          //     //       value: value,
          //     //       onChanged: (newValue) {
          //     //         Provider.of<Settings>(context, listen: false)
          //     //             .backgroundMusic = newValue;
          //     //       },
          //     //     );
          //     //   },
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
