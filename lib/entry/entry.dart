import 'package:flutter/material.dart';
import 'package:seafood_crossing/entry/home.dart';

class SeafoodCrossingEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seafood Crossing',
      theme: ThemeData(),
      routes: {
        SeafoodCrossingHome.route: (context) => SeafoodCrossingHome(),
      },
      initialRoute: SeafoodCrossingHome.route,
    );
  }
}
