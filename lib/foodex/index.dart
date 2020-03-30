import 'package:flutter/material.dart';

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
        title: Text('Foodex'),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: "Fish"),
            Tab(text: "Insect"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("Tab 1"),
          Text("Tab 2"),
        ],
      ),
    );
  }
}
