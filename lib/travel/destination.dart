import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/travel/localizations.dart';
import 'package:seafood_crossing/travel/category/data.dart';
import 'package:seafood_crossing/travel/category/enum.dart';
import 'package:seafood_crossing/travel/repository/fetch.dart';
import 'package:seafood_crossing/travel/repository/visit.dart';

class Destination extends StatefulWidget {
  final FetchRepositoryElement fetchElement;
  final bool isMe;

  Destination({
    @required this.fetchElement,
    @required this.isMe,
  });

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  String _accessCode;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    final TravelLocalizations travelLocalizations =
        TravelLocalizations.of(context);

    final DestinationCategory category = widget.fetchElement.category;
    final String titleKey = destinationDestinationTitle[category];
    final String subtitleKey = destinationDestinationReceiverSubtitle[category];
    final IconData icon = destinationDestinationIcon[category];

    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText('destination'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              print(value);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'report',
                child: coreLocalizations.getText('report'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(icon),
                title: travelLocalizations.getText(titleKey),
                subtitle: travelLocalizations.getText(subtitleKey),
              ),
            ),
            ListTile(
              leading: Icon(Icons.title),
              title: coreLocalizations.getText('title'),
              subtitle: Text(widget.fetchElement.title),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: coreLocalizations.getText('description'),
              subtitle: Text(widget.fetchElement.description),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: coreLocalizations.getText('occupancy-count'),
              subtitle: Text(widget.fetchElement.occupanciesLength.toString()),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: coreLocalizations.getText('report-count'),
              subtitle: Text(widget.fetchElement.reportLength.toString()),
            ),
            this._buildAccessCode(context),
            this._buildApplyVisitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessCode(BuildContext context) {
    if (this._accessCode == null) {
      return Container();
    }

    return ListTile(
      leading: Icon(Icons.vpn_key),
      title: CoreLocalizations.of(context).getText('access-code'),
      subtitle: Text(this._accessCode),
    );
  }

  Widget _buildApplyVisitButton(BuildContext context) {
    if (widget.isMe) {
      return Container();
    }

    if (this._accessCode != null) {
      return Container();
    }

    if (this._loading) {
      return Container(
        padding: const EdgeInsets.only(
          right: 12.0,
        ),
        child: RaisedButton(
          child: CoreLocalizations.of(context).getText('applying-visit'),
          onPressed: null,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(
        right: 12.0,
      ),
      child: RaisedButton(
        child: CoreLocalizations.of(context).getText('apply-visit'),
        onPressed: this._visitDestination,
      ),
    );
  }

  Future<void> _visitDestination() async {
    if (this.mounted) {
      this.setState(() {
        this._loading = true;
      });
    }

    final VisitRepositoryResponse response = await visitRepository(
      destinationId: widget.fetchElement.destinationId,
    );

    if (this.mounted) {
      this.setState(() {
        this._accessCode = response.accessCode;
        this._loading = false;
      });
    }
  }
}
