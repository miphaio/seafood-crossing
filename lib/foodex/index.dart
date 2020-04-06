import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/list.dart';
import 'package:seafood_crossing/foodex/data/fish.dart';
import 'package:seafood_crossing/foodex/data/insect.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/smash/localizations.dart';

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
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    final SmashLocalizations smashLocalizations =
        SmashLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coreLocalizations.getString('foodex'),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'source-fish-image':
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              smashLocalizations.getText('source-fish-image'),
                          // spell-checker:disable-next-line
                          content: Text('millenium.us.org'),
                        );
                      },
                    );
                    return;
                  }
                case 'source-insect-image':
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              smashLocalizations.getText('source-insect-image'),
                          // spell-checker:disable-next-line
                          content: Text('nocookie.net'),
                        );
                      },
                    );
                    return;
                  }
              }
              return;
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'source-fish-image',
                child: smashLocalizations.getText('source-fish-image'),
              ),
              PopupMenuItem(
                value: 'source-insect-image',
                child: smashLocalizations.getText('source-insect-image'),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: coreLocalizations.getString('fish')),
            Tab(text: coreLocalizations.getString('insect')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FoodexList(
            items: fishData,
          ),
          FoodexList(
            items: insectData,
          ),
        ],
      ),
    );
  }
}
