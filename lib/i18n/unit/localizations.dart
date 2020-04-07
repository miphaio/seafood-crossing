import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/unit/unit-en.dart';
import 'package:seafood_crossing/i18n/unit/unit-zh.dart';

class UnitLocalizations {
  final Locale locale;

  UnitLocalizations(this.locale);

  static UnitLocalizations of(BuildContext context) {
    return Localizations.of<UnitLocalizations>(context, UnitLocalizations);
  }

  static _UnitLocalizationsDelegate delegate = _UnitLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': unitLocalizationEnglish,
    'zh': unitLocalizationChinese,
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

  String getBellString(int bell) {
    final String bellText = this.getString('bell');
    return '$bell $bellText';
  }

  Text getBellText(int bell) {
    return Text(this.getBellString(bell));
  }
}

class _UnitLocalizationsDelegate
    extends LocalizationsDelegate<UnitLocalizations> {
  const _UnitLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<UnitLocalizations> load(Locale locale) {
    return SynchronousFuture<UnitLocalizations>(
      UnitLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_UnitLocalizationsDelegate before) => false;
}
