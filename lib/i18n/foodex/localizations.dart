import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/foodex/foodex-en.dart';
import 'package:seafood_crossing/i18n/foodex/foodex-zh.dart';

class FoodexLocalizations {
  final Locale locale;

  FoodexLocalizations(this.locale);

  static FoodexLocalizations of(BuildContext context) {
    return Localizations.of<FoodexLocalizations>(context, FoodexLocalizations);
  }

  static _FoodexLocalizationsDelegate delegate = _FoodexLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': foodexLocalizationEnglish,
    'zh': foodexLocalizationChinese,
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

class _FoodexLocalizationsDelegate
    extends LocalizationsDelegate<FoodexLocalizations> {
  const _FoodexLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<FoodexLocalizations> load(Locale locale) {
    return SynchronousFuture<FoodexLocalizations>(
      FoodexLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_FoodexLocalizationsDelegate before) => false;
}
