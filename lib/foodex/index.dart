import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 125.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Foodex'),
              titlePadding: EdgeInsets.only(
                left: 24,
                bottom: 50,
              ),
              background: CachedNetworkImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2019/04/16/10/01/seabass-4131337_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
            elevation: 2.0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Fish"),
                Tab(text: "Insect"),
              ],
              controller: this._tabController,
            ),
          ),
          SliverStickyHeader(
            header: Container(
              color: Colors.red,
              height: 48.0,
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
                childCount: 200,
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
