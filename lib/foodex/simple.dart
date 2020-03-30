import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 2,
    );
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
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
              expandedHeight: 100.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: "Fish"),
                  Tab(text: "Insect"),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            this._buildFilter(),
            Container(),
          ],
          controller: _tabController,
        ),
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
