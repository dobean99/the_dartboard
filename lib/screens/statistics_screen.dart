import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/models/score.dart';
import 'package:the_dartboard/screens/main_menu.dart';
import 'package:the_dartboard/widgets/commons/base_layout.dart';
import 'package:the_dartboard/widgets/commons/circle_stroke_button.dart';
import 'package:the_dartboard/widgets/commons/title_screen.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              TitleScreen(
                text: context.l10n!.statistics,
              ),
              Center(
                child: Container(
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
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 25.0, bottom: 30, right: 15),
                      child: Consumer<Score>(builder: (context, score, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                            dividerTheme: const DividerThemeData(
                              color: Colors.transparent,
                              space: 0,
                              thickness: 0,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ),
                          child: DataTable(
                            horizontalMargin: 0,
                            dataRowMaxHeight: 30,
                            dataRowMinHeight: 20,
                            columnSpacing: 0,
                            dividerThickness: 0.0,
                            columns: <DataColumn>[
                              const DataColumn(
                                label: Text(
                                  '',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  context.l10n!.win,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  context.l10n!.lose,
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
                                    Text(
                                      score.totalPlayerWin.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      (score.totalRounds - score.totalPlayerWin)
                                          .toString(),
                                      style: const TextStyle(fontSize: 16),
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
                                    Text(
                                      (score.totalRounds - score.totalPlayerWin)
                                          .toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      score.totalPlayerWin.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
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
        ],
      ),
    );
  }
}
