import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/travel/declare/category.dart';

class AddDestinationCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText('select-category'),
      ),
      body: ListView(
        children: this._buildCategories(),
      ),
    );
  }

  List<Widget> _buildCategories() {
    return DestinationCategory.list.map((DestinationCategory category) {
      return ListTile(
        title: Text(category.value),
        onTap: () {},
      );
    }).toList();
  }
}
