import 'dart:io';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:the_dartboard/config/assets/assets.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/config/theme/app_theme.dart';
import 'package:the_dartboard/game/managers/audio_manager.dart';
import 'package:the_dartboard/screens/loading_screen.dart';

import 'models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Settings settings = await _readSettings();
  AudioManager.instance.init([AudioAssets.bgAudio], settings);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Settings()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
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
          title: 'Ballon in the sky',
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

Future<Settings> _readSettings() async {
  final pref = await Hive.openBox('Settings');
  if (pref.get('bgm') == null) {
    pref.put('bgm', true);
  }
  return Settings(bgm: pref.get('bgm'));
}
