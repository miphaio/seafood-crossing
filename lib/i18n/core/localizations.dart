import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/core-en.dart';
import 'package:seafood_crossing/i18n/core/core-zh.dart';

class CoreLocalizations {
  final Locale locale;

  CoreLocalizations(this.locale);

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  static _CoreLocalizationsDelegate delegate = _CoreLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': coreLocationEnglish,
    'zh': coreLocationChinese,
  };

  Map<String, String> get _stringMap {
    return _localizedValues[locale.languageCode];
  }

  String get title {
    return _stringMap['title'];
  }
}

class _CoreLocalizationsDelegate
    extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(CoreLocalizations(locale));
  }

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}
