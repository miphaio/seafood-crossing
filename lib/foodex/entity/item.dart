import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/foodex/localizations.dart';

class FoodexItemEntity {
  final String name;
  final String icon;
  final List<int> northernMonths;
  final List<int> southernMonths;
  final List<int> hours;

  FoodexItemEntity({
    @required this.name,
    @required this.icon,
    @required this.northernMonths,
    @required this.southernMonths,
    @required this.hours,
  });

  String getDisplayName(BuildContext context) {
    return FoodexLocalizations.of(context).getString(this.name);
  }
}
