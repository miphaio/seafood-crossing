import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/components/item.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';
import 'package:unicorndial/unicorndial.dart';

class FoodexList extends StatelessWidget {
  final List<FoodexItemEntity> items;

  FoodexList({
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: this.items.length,
              itemBuilder: (BuildContext context, int index) {
                final FoodexItemEntity current = this.items[index];
                return FoodexItem(
                  item: current,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: UnicornDialer(
        parentButton: Icon(Icons.search),
        childButtons: _buildMenu(),
      ),
    );
  }

  List<UnicornButton> _buildMenu() {
    return <UnicornButton>[
      UnicornButton(
        currentButton: FloatingActionButton(
          mini: true,
          child: Icon(Icons.ac_unit),
          onPressed: () {},
        ),
      ),
      UnicornButton(
        currentButton: FloatingActionButton(
          mini: true,
          child: Icon(Icons.ac_unit),
          onPressed: () {},
        ),
      ),
    ];
  }
}
