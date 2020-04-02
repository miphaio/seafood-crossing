import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/foodex/localizations.dart';
import 'package:seafood_crossing/i18n/smash/localizations.dart';

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
      title: Text(
        FoodexLocalizations.of(context).getString(this.item.name),
      ),
      subtitle: Text(this.item.price.toString()),
      children: <Widget>[
        ListTile(
          dense: true,
          leading: Icon(Icons.date_range),
          title: Text(
            CoreLocalizations.of(context).getString('active-months'),
          ),
          subtitle: this._buildMonths(context),
        ),
        ListTile(
          dense: true,
          leading: Icon(Icons.access_time),
          title: Text(
            CoreLocalizations.of(context).getString('active-time'),
          ),
          subtitle: this._buildTime(context),
        ),
      ],
    );
  }

  Widget _buildMonths(BuildContext context) {
    if (this.item.northernMonths.length == 12) {
      return Container(
        child: Text(
          SmashLocalizations.of(context).getString('all-year'),
        ),
      );
    }

    if (this.item.northernMonths.length > 0) {
      return Wrap(
        spacing: 1.0,
        children: this.item.northernMonths.map((int month) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                SmashLocalizations.of(context).getMonth(month),
              ),
            ),
          );
        }).toList(),
      );
    }
    return Text(
      CoreLocalizations.of(context).getString('no-data'),
    );
  }

  Widget _buildTime(BuildContext context) {
    if (this.item.hours.length == 24) {
      return Container(
        child: Text(
          SmashLocalizations.of(context).getString('all-day'),
        ),
      );
    }

    if (this.item.hours.length > 0) {
      return Wrap(
        spacing: 1.0,
        children: this.item.hours.map((int hour) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                hour.toString(),
              ),
            ),
          );
        }).toList(),
      );
    }
    return Text(
      CoreLocalizations.of(context).getString('no-data'),
    );
  }
}
