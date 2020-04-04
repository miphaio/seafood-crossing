import 'package:flutter/material.dart';
import 'package:seafood_crossing/common/account.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';
import 'package:unicorndial/unicorndial.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<FetchRepositoryElement> _destinations = [];

  @override
  void initState() {
    super.initState();
    this.fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    return AccountWrapper(
      child: Scaffold(
        body: ListView.builder(
          itemCount: this._destinations.length,
          itemBuilder: (context, index) {
            final FetchRepositoryElement element = this._destinations[index];
            return ListTile(
              title: Text(element.title),
              subtitle: Text(element.description),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> fetchDestination() async {
    final List<FetchRepositoryElement> destinations = await fetchRepository();
    this.setState(() {
      this._destinations = destinations;
    });
  }
}
