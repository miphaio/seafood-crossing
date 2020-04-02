import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/smash/smash-en.dart';
import 'package:seafood_crossing/i18n/smash/smash-zh.dart';

class SmashLocalizations {
  final Locale locale;

  SmashLocalizations(this.locale);

  static SmashLocalizations of(BuildContext context) {
    return Localizations.of<SmashLocalizations>(context, SmashLocalizations);
  }

  static _SmashLocalizationsDelegate delegate = _SmashLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': smashLocalizationEnglish,
    'zh': smashLocalizationChinese,
  };

  Map<String, String> get _stringMap {
    final Map<String, String> map = _localizedValues[locale.languageCode];
    if (map == null) {
      return {};
    }
    return map;
  }

  String getString(String key) {
    final String value = this._stringMap[key];
    if (value == null) {
      return "[$key]";
    }
    return value;
  }
}

class _SmashLocalizationsDelegate
    extends LocalizationsDelegate<SmashLocalizations> {
  const _SmashLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<SmashLocalizations> load(Locale locale) {
    return SynchronousFuture<SmashLocalizations>(
      SmashLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_SmashLocalizationsDelegate before) => false;
}
