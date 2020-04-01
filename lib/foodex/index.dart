import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/list.dart';
import 'package:seafood_crossing/foodex/data/insect.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class FoodexIndex extends StatefulWidget {
  @override
  _FoodexIndexState createState() => _FoodexIndexState();
}

class _FoodexIndexState extends State<FoodexIndex>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CoreLocalizations.of(context).getString('foodex'),
        ),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: CoreLocalizations.of(context).getString('fish')),
            Tab(text: CoreLocalizations.of(context).getString('insect')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("Tab 1"),
          FoodexList(
            items: insectData,
          ),
        ],
      ),
    );
  }
}
