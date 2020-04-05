import 'package:flutter/material.dart';
import 'package:seafood_crossing/common/account.dart';
import 'package:seafood_crossing/travel/add-destination.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';
import 'package:seafood_crossing/util/user-info.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<FetchRepositoryElement> _destinations = [];

  String _accountId;

  @override
  void initState() {
    super.initState();
    this.fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    return AccountWrapper(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: this.fetchDestination,
          child: ListView.builder(
            itemCount: this._destinations.length,
            itemBuilder: (context, index) {
              final FetchRepositoryElement element = this._destinations[index];
              final bool isMe = element.accountId == this._accountId;
              return ListTile(
                leading: Icon(Icons.airplanemode_active),
                title: Text(
                  element.title,
                  style: TextStyle(
                    color: isMe ? Theme.of(context).errorColor : null,
                  ),
                ),
                subtitle: Text(element.description),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDestination(),
              ),
            ).whenComplete(this.fetchDestination);
          },
        ),
      ),
    );
  }

  Future<void> fetchDestination() async {
    await this.updateAccountId();
    final List<FetchRepositoryElement> destinations = await fetchRepository();

    this.setState(() {
      this._destinations = destinations;
    });
  }

  Future<void> updateAccountId() async {
    final UserInfo info = await UserInfo.gather();
    this.setState(() {
      this._accountId = info.accountId;
    });
  }
}
