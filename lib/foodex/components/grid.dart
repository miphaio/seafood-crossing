import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/item.dart';
import 'package:seafood_crossing/foodex/data/insect.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';

class FoodexGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisCount: 2,
      children: List.generate(
        insectData.length,
        (index) {
          FoodexItemEntity current = insectData[index];
          return FoodexItem(
            item: current,
          );
        },
      ),
    );
  }
}
