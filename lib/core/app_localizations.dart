import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, String> _localizedStrings = {};

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonString = await rootBundle.loadString('l10n/${locale.languageCode}.json');
    _localizedStrings = json.decode(jsonString).cast<String, String>();
    return AppLocalizations(locale);
  }

  // Add the 'of' method
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Dynamic method to get localized strings
  String? translate(String key) {
    return _localizedStrings[key];
  }

}

extension LocalizationExtension on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this)?.translate(key)??'';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fa'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
