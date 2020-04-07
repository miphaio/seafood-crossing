import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/list.dart';
import 'package:seafood_crossing/foodex/data/insect.dart';

class FoodexInsectTab extends StatefulWidget {
  @override
  _FoodexInsectTabState createState() => _FoodexInsectTabState();
}

class _FoodexInsectTabState extends State<FoodexInsectTab>
    with AutomaticKeepAliveClientMixin<FoodexInsectTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FoodexList(
      items: insectData,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
