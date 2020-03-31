import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/item.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';

var a = [1, 2, 3, 4, 5, 6, 6, 6, 6, 6, 6];

class FoodexGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        a.length,
        (index) {
          int current = a[index];
          return FoodexItem(
            item: FoodexItemEntity(
              name: current.toString(),
            ),
          );
        },
      ),
    );
  }
}
