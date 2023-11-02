import 'package:flutter/material.dart';

extension FullNameLocale on Locale {
  String fullName() {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'pt':
        return 'Portugues';
      case 'ru':
        return 'РУССКИЙ';
    }
    return '';
  }
}
