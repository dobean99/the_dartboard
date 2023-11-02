import 'package:flutter/material.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/widgets/commons/base_layout.dart';

// This class represents the settings menu.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Game title.
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  context.l10n!.settings,
                  style: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                ),
              ),

              // Switch for sound effects.
              // Selector<Settings, bool>(
              //   selector: (context, settings) => settings.soundEffects,
              //   builder: (context, value, child) {
              //     return SwitchListTile(
              //       title: const Text('Sound Effects'),
              //       value: value,
              //       onChanged: (newValue) {
              //         Provider.of<Settings>(context, listen: false).soundEffects =
              //             newValue;
              //       },
              //     );
              //   },
              // ),

              // Switch for background music.
              // Selector<Settings, bool>(
              //   selector: (context, settings) => settings.backgroundMusic,
              //   builder: (context, value, child) {
              //     return SwitchListTile(
              //       title: const Text('Background Music'),
              //       value: value,
              //       onChanged: (newValue) {
              //         Provider.of<Settings>(context, listen: false)
              //             .backgroundMusic = newValue;
              //       },
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
