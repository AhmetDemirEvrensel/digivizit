import 'package:flutter/material.dart';

enum AppLanguage { tr, en }

extension AppLanguageExt on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.tr:
        return "TR";
      case AppLanguage.en:
        return "EN";
    }
  }

  String get lowerCode {
    switch (this) {
      case AppLanguage.tr:
        return "tr";
      case AppLanguage.en:
        return "en";
    }
  }

  String get name {
    switch (this) {
      case AppLanguage.tr:
        return 'Turkish';
      case AppLanguage.en:
        return 'English';
    }
  }

  String get icon {
    switch (this) {
      case AppLanguage.tr:
        return 'tr';
      case AppLanguage.en:
        return 'en';
    }
  }

  Locale get locale {
    switch (this) {
      case AppLanguage.tr:
        return const Locale('tr', 'TR');
      case AppLanguage.en:
        return const Locale('en', 'US');
    }
  }
}
