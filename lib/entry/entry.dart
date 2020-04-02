import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seafood_crossing/entry/home.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/foodex/localizations.dart';
import 'package:seafood_crossing/i18n/smash/localizations.dart';

class SeafoodCrossingEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        CoreLocalizations.delegate,
        FoodexLocalizations.delegate,
        SmashLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      title: 'Seafood Crossing',
      theme: ThemeData(),
      routes: {
        SeafoodCrossingHome.route: (context) => SeafoodCrossingHome(),
      },
      initialRoute: SeafoodCrossingHome.route,
    );
  }
}
