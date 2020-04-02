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

  String getMonth(int month) {
    switch (month) {
      case 1:
        return this.getString('january');
      case 2:
        return this.getString('february');
      case 3:
        return this.getString('march');
      case 4:
        return this.getString('april');
      case 5:
        return this.getString('may');
      case 6:
        return this.getString('june');
      case 7:
        return this.getString('july');
      case 8:
        return this.getString('august');
      case 9:
        return this.getString('september');
      case 10:
        return this.getString('october');
      case 11:
        return this.getString('november');
      case 12:
        return this.getString('december');
    }
    return "[$month]";
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
