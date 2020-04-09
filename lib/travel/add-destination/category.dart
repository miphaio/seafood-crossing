import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/travel/localizations.dart';
import 'package:seafood_crossing/travel/add-destination/information.dart';
import 'package:seafood_crossing/travel/category/data.dart';
import 'package:seafood_crossing/travel/category/enum.dart';

class AddDestinationCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TravelLocalizations travelLocalizations =
        TravelLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: travelLocalizations.getText('select-category'),
      ),
      body: ListView(
        children: this._buildCategories(context),
      ),
    );
  }

  List<Widget> _buildCategories(BuildContext context) {
    final TravelLocalizations travelLocalizations =
        TravelLocalizations.of(context);

    return DestinationCategory.list.map((DestinationCategory category) {
      final String titleKey = destinationDestinationTitle[category];
      final String subtitleKey = destinationDestinationSubtitle[category];
      final IconData icon = destinationDestinationIcon[category];

      return ListTile(
        leading: Icon(icon),
        title: travelLocalizations.getText(titleKey),
        subtitle: travelLocalizations.getText(subtitleKey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddDestinationInformation(
                category: category,
              ),
            ),
          );
        },
      );
    }).toList();
  }
}
