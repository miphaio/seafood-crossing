import 'package:flutter/material.dart';
import 'package:seafood_crossing/collectable/index.dart';

class SeafoodCrossingEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        CollectableIndex.route: (context) => CollectableIndex(),
      },
      initialRoute: CollectableIndex.route,
    );
  }
}
