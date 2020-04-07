import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/foodex/localizations.dart';
import 'package:seafood_crossing/i18n/smash/localizations.dart';
import 'package:seafood_crossing/i18n/unit/localizations.dart';

class FoodexItem extends StatelessWidget {
  final FoodexItemEntity item;

  FoodexItem({
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CachedNetworkImage(
        imageUrl: this.item.icon,
        width: 32,
        height: 32,
      ),
      title: FoodexLocalizations.of(context).getText(this.item.name),
      subtitle: UnitLocalizations.of(context).getBellText(this.item.price),
      children: <Widget>[
        this._buildMonthTile(context),
        this._buildTimeTile(context),
      ],
    );
  }

  Widget _buildMonthTile(BuildContext context) {
    if (this.item.northernMonths.length == 12) {
      return ListTile(
        dense: true,
        leading: Icon(Icons.date_range),
        title: SmashLocalizations.of(context).getText('active-months-all-year'),
      );
    }
    return ListTile(
      dense: true,
      leading: Icon(Icons.date_range),
      title: SmashLocalizations.of(context).getText('active-months'),
      subtitle: this._buildMonths(context),
    );
  }

  Widget _buildTimeTile(BuildContext context) {
    if (this.item.hours.length == 24) {
      return ListTile(
        dense: true,
        leading: Icon(Icons.access_time),
        title: SmashLocalizations.of(context).getText('active-time-all-day'),
      );
    }

    return ListTile(
      dense: true,
      leading: Icon(Icons.access_time),
      title: SmashLocalizations.of(context).getText('active-time'),
      subtitle: this._buildTime(context),
    );
  }

  Widget _buildMonths(BuildContext context) {
    if (this.item.northernMonths.length == 12) {
      return Container(
        child: SmashLocalizations.of(context).getText('all-year'),
      );
    }

    if (this.item.northernMonths.length > 0) {
      return Wrap(
        spacing: 1.0,
        children: this.item.northernMonths.map((int month) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              child: SmashLocalizations.of(context).getMonthText(month),
            ),
          );
        }).toList(),
      );
    }
    return CoreLocalizations.of(context).getText('no-data');
  }

  Widget _buildTime(BuildContext context) {
    if (this.item.hours.length == 24) {
      return Container(
        child: SmashLocalizations.of(context).getText('all-day'),
      );
    }

    if (this.item.hours.length > 0) {
      return Wrap(
        spacing: 1.0,
        children: this.item.hours.map((int hour) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              child: SmashLocalizations.of(context).getHourText(hour),
            ),
          );
        }).toList(),
      );
    }
    return CoreLocalizations.of(context).getText('no-data');
  }
}
