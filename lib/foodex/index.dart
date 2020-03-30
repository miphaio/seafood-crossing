import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class FoodexIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 125.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Foodex'),
              background: CachedNetworkImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2019/04/16/10/01/seabass-4131337_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              color: Colors.red,
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: this._buildFilter(),
            ),
            sliver: SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return Wrap(
      spacing: 5.0,
      children: <Widget>[
        InputChip(
          label: Text("Fish"),
          onPressed: () {},
        ),
        InputChip(
          label: Text("Insect"),
          onPressed: () {},
        ),
      ],
    );
  }
}
