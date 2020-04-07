import 'package:flutter/material.dart';
import 'package:seafood_crossing/about/index.dart';
import 'package:seafood_crossing/foodex/index.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/index.dart';

class SeafoodCrossingHome extends StatefulWidget {
  static const String route = '/home';

  @override
  _SeafoodCrossingHomeState createState() => _SeafoodCrossingHomeState();
}

class _SeafoodCrossingHomeState extends State<SeafoodCrossingHome> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Scaffold(
      body: this._buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: coreLocalizations.getText('travel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: coreLocalizations.getText('foodex'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: coreLocalizations.getText('seafood-crossing'),
          ),
        ],
        currentIndex: this._selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (this._selectedIndex) {
      case 0:
        return TravelIndex();
      case 1:
        return FoodexIndex();
      case 2:
        return AboutIndex();
    }

    return Container();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
