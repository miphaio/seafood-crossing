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

  Text getText(String key) {
    return Text(this.getString(key));
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

  Text getMonthText(int month) {
    return Text(this.getMonth(month));
  }

  String getHour(int hour) {
    switch (hour) {
      case 1:
        return this.getString('1-am');
      case 2:
        return this.getString('2-am');
      case 3:
        return this.getString('3-am');
      case 4:
        return this.getString('4-am');
      case 5:
        return this.getString('5-am');
      case 6:
        return this.getString('6-am');
      case 7:
        return this.getString('7-am');
      case 8:
        return this.getString('8-am');
      case 9:
        return this.getString('9-am');
      case 10:
        return this.getString('10-am');
      case 11:
        return this.getString('11-am');
      case 12:
        return this.getString('12-am');
      case 13:
        return this.getString('1-pm');
      case 14:
        return this.getString('2-pm');
      case 15:
        return this.getString('3-pm');
      case 16:
        return this.getString('4-pm');
      case 17:
        return this.getString('5-pm');
      case 18:
        return this.getString('6-pm');
      case 19:
        return this.getString('7-pm');
      case 20:
        return this.getString('8-pm');
      case 21:
        return this.getString('9-pm');
      case 22:
        return this.getString('10-pm');
      case 23:
        return this.getString('11-pm');
      case 24:
        return this.getString('12-pm');
    }
    return "[$hour]";
  }

  Text getHourText(int hour) {
    return Text(this.getHour(hour));
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
