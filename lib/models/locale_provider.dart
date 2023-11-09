import 'package:flutter/material.dart';
import 'package:the_dartboard/config/assets/png_assets.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  getIcon(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return PngAssets.engIcon;
      case 'pt':
        return PngAssets.porIcon;
      case 'ru':
        return PngAssets.rusIcon;
    }
  }
}
