import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/travel/travel-en.dart';
import 'package:seafood_crossing/i18n/travel/travel-zh.dart';

class TravelLocalizations {
  final Locale locale;

  TravelLocalizations(this.locale);

  static TravelLocalizations of(BuildContext context) {
    return Localizations.of<TravelLocalizations>(context, TravelLocalizations);
  }

  static _TravelLocalizationsDelegate delegate = _TravelLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': travelLocalizationEnglish,
    'zh': travelLocalizationChinese,
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
}

class _TravelLocalizationsDelegate
    extends LocalizationsDelegate<TravelLocalizations> {
  const _TravelLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<TravelLocalizations> load(Locale locale) {
    return SynchronousFuture<TravelLocalizations>(
      TravelLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_TravelLocalizationsDelegate before) => false;
}
