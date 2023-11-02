import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_dartboard/config/l10n/l10n.dart';
import 'package:the_dartboard/config/theme/app_theme.dart';
import 'package:the_dartboard/screens/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ballon in the sky',
      theme: AppTheme.darkTheme,
      home: const LoadingScreen(),
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: provider.locale,
      onGenerateTitle: (context) => context.l10n!.appName,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
