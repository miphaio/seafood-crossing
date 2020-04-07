import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/list.dart';
import 'package:seafood_crossing/foodex/data/fish.dart';

class FoodexFishTab extends StatefulWidget {
  @override
  _FoodexFishTabState createState() => _FoodexFishTabState();
}

class _FoodexFishTabState extends State<FoodexFishTab>
    with AutomaticKeepAliveClientMixin<FoodexFishTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FoodexList(
      items: fishData,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
