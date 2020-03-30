import 'package:flutter/material.dart';

var a = [
  1,
  2,
  3,
  4,
  5,
];

class FoodexGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        a.length,
        (index) {
          int current = a[index];
          return Container(
            child: Text(current.toString()),
          );
        },
      ),
    );
  }
}
