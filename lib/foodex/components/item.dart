import 'package:cached_network_image/cached_network_image.dart';
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
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: this.item.icon,
              width: 32,
              height: 32,
            ),
            Text(this.item.name),
            Text(this.item.price.toString()),
          ],
        ),
      ),
    );
  }
}
