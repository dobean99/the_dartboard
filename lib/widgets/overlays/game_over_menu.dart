import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/the_dartboard.dart';
import 'package:the_dartboard/screens/main_menu.dart';
import 'package:the_dartboard/widgets/commons/stroke_text.dart';
import 'package:the_dartboard/widgets/overlays/home_button.dart';

import '../../models/models.dart';

class GameOverMenu extends StatelessWidget {
  static const String id = 'GameOverMenu';
  final TheDartboard game;
  const GameOverMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.blackColor.withAlpha(100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(text: _getTextTitle(context)),
            const SizedBox(
              height: 10,
            ),
            // Image(image: AssetImage(PngAssets.boardBackground)),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    PngAssets.boardBackground,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                height: 176,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DataTable(
                    // horizontalMargin: 0,
                    // dataRowMaxHeight: 25,
                    // dataRowMinHeight: 16,
                    columnSpacing: 5,
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                          width: 1,
                          color: AppColors.whiteColor,
                          style: BorderStyle.solid),
                      verticalInside: BorderSide(
                          width: 1,
                          color: AppColors.whiteColor,
                          style: BorderStyle.solid),
                    ),

                    // border: TableBorder.all(color: AppColors.whiteColor),
                    columns: <DataColumn>[
                      const DataColumn(
                        label: Text(
                          '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          context.l10n!.rounds,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          context.l10n!.points,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              context.l10n!.player,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                game.playerRounds.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                game.playerScore.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              context.l10n!.computer,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                game.computerRounds.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                game.computerScore.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            HomeButton(
              game: game,
              isBottom: true,
              onPressed: () {
                game.overlays.remove(GameOverMenu.id);
                game.resumeEngine();
                score.updateScore(game.playerScore, game.computerScore);
                game.reset();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainMenu(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _checkWinner() => game.playerScore < game.computerScore;

  String _getTextTitle(BuildContext context) {
    return _checkWinner() ? context.l10n!.youWin : context.l10n!.youLose;
  }
}
