import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/core/constants/app_colors.dart';
import 'package:the_dartboard/game/the_dartboard.dart';
import 'package:the_dartboard/widgets/commons/stroke_text.dart';
import 'package:the_dartboard/widgets/overlays/home_button.dart';

class GameOverMenu extends StatelessWidget {
  static const String id = 'GameOverMenu';
  final TheDartboard game;
  const GameOverMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withAlpha(100),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(text: context.l10n!.youWin),
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
                          const DataCell(
                            Center(
                              child: Text(
                                '43',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text(
                                '43',
                                style: TextStyle(fontSize: 16),
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
                          const DataCell(
                            Center(
                              child: Text(
                                '43',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text(
                                '43',
                                style: TextStyle(fontSize: 16),
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
            ),
          ],
        ),
      ),
    );
  }
}
