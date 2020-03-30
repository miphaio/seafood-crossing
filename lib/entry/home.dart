import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/index.dart';
import 'package:seafood_crossing/foodex/simple.dart';

class SeafoodCrossingHome extends StatefulWidget {
  static const String route = '/home';

  @override
  _SeafoodCrossingHomeState createState() => _SeafoodCrossingHomeState();
}

class _SeafoodCrossingHomeState extends State<SeafoodCrossingHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text('Travel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Foodex'),
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
        return Container();
      case 1:
        return Test();
    }

    return Container();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
