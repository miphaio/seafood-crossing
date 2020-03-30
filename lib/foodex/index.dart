import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FoodexIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Foodex'),
              background: CachedNetworkImage(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2019/04/16/10/01/seabass-4131337_1280.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Text("123"),
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
