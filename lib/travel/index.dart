import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class TravelIndex extends StatefulWidget {
  @override
  _TravelIndexState createState() => _TravelIndexState();
}

class _TravelIndexState extends State<TravelIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoreLocalizations.of(context).getText('travel'),
      ),
      body: Center(
        child: CoreLocalizations.of(context).getText('not-implemented'),
      ),
    );
  }
}
