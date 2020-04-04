import 'package:flutter/material.dart';
import 'package:seafood_crossing/common/account.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';

class TravelIndex extends StatefulWidget {
  @override
  _TravelIndexState createState() => _TravelIndexState();
}

class _TravelIndexState extends State<TravelIndex> {
  List<FetchRepositoryElement> destinations;

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
        child: Center(
          child: CoreLocalizations.of(context).getText('not-implemented'),
        ),
      ),
    );
  }

  Future<void> fetchDestination() async {
    final List<FetchRepositoryElement> destinations = await fetchRepository();
    print(destinations);
  }
}
