import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/config/theme/app_theme.dart';
import 'package:the_dartboard/screens/loading_screen.dart';

import 'models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  await initHive();
  // Settings settings = await getSettings();
  // AudioManager.instance.init([AudioAssets.bgAudio], settings);
  runApp(
    MultiProvider(
        providers: [
          FutureProvider<Score>(
            create: (BuildContext context) => getScore(),
            initialData: Score(totalPlayerWin: 10, totalRounds: 5),
          ),
          FutureProvider<Settings>(
              create: (BuildContext context) => getSettings(),
              initialData: Settings(bgm: false)),
        ],
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<Score>.value(
                value: Provider.of<Score>(context),
              ),
              ChangeNotifierProvider<Settings>.value(
                value: Provider.of<Settings>(context),
              ),
              ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ],
            child: const MyApp(),
          );
        }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, provider, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The Dartboard',
          theme: AppTheme.darkTheme,
          home: const LoadingScreen(),
          supportedLocales: AppLocalizations.supportedLocales,
          locale: provider.locale,
          onGenerateTitle: (context) => context.l10n!.appName,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(ScoreAdapter());
}

Future<Score> getScore() async {
  final box = await Hive.openBox<Score>(Score.scoresBox);
  final scoreData = box.get(Score.scoresData);
  if (scoreData == null) {
    box.put(Score.scoresData, Score(totalRounds: 0, totalPlayerWin: 0));
  }
  return box.get(Score.scoresData)!;
}

Future<Settings> getSettings() async {
  final box = await Hive.openBox<Settings>(Settings.settingsBox);
  final settings = box.get(Settings.settingsKey);
  if (settings == null) {
    box.put(Settings.settingsKey, Settings(bgm: true));
  }

  return box.get(Settings.settingsKey)!;
}
