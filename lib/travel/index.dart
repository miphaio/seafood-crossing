import 'package:flutter/material.dart';
import 'package:seafood_crossing/common/account.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';

class TravelIndex extends StatefulWidget {
  @override
  _TravelIndexState createState() => _TravelIndexState();
}

class _TravelIndexState extends State<TravelIndex> {
  List<FetchRepositoryElement> _destinations = [];

  @override
  void initState() {
    super.initState();
    this.fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoreLocalizations.of(context).getText('travel'),
      ),
      body: AccountWrapper(
        child: ListView.builder(
          itemCount: this._destinations.length,
          itemBuilder: (context, index) {
            final FetchRepositoryElement element = this._destinations[index];
            return ListTile(
              title: Text(element.title),
              subtitle: Text(element.description),
            );
          },
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
