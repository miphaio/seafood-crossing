import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';

class FoodexItem extends StatelessWidget {
  final FoodexItemEntity item;

  FoodexItem({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(this.item.name),
    );
  }
}
