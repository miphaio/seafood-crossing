import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/add-destination/category.dart';
import 'package:seafood_crossing/travel/destination.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';
import 'package:seafood_crossing/util/user-info.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<FetchRepositoryElement> _destinations = [];

  String _accountId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    this.fetchDestination();
  }

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    if (this._destinations == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.bug_report),
              isThreeLine: true,
              title: coreLocalizations.getText('server-went-wrong-title'),
              subtitle: coreLocalizations.getText('server-went-wrong-subtitle'),
            ),
          ),
        ],
      );
    }
    return this._buildTravel();
  }

  Widget _buildTravel() {
    return Scaffold(
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Destination(
                      fetchElement: element,
                      isMe: isMe,
                    ),
                  ),
                ).whenComplete(this.fetchDestination);
              },
            );
          },
        ),
      ),
      floatingActionButton: this._buildFloatingButton(),
    );
  }

  Widget _buildFloatingButton() {
    if (this._loading) {
      return null;
    }
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddDestinationCategory(),
          ),
        ).whenComplete(this.fetchDestination);
      },
    );
  }

  Future<void> fetchDestination() async {
    await this.updateAccountId();

    if (this.mounted) {
      this.setState(() {
        this._loading = true;
      });
    }

    final List<FetchRepositoryElement> destinations = await fetchRepository();

    if (this.mounted) {
      this.setState(() {
        this._destinations = destinations;
        this._loading = false;
      });
    }
  }

  Future<void> updateAccountId() async {
    final UserInfo info = await UserInfo.gather();
    if (this.mounted) {
      this.setState(() {
        this._accountId = info.accountId;
      });
    }
  }
}
