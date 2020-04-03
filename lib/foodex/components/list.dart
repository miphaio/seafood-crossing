import 'package:flutter/material.dart';
import 'package:seafood_crossing/common/components/input-dialog.dart';
import 'package:seafood_crossing/foodex/components/item.dart';
import 'package:seafood_crossing/foodex/entity/item.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/foodex/foodex-en.dart';
import 'package:seafood_crossing/i18n/foodex/foodex-zh.dart';
import 'package:seafood_crossing/i18n/smash/localizations.dart';
import 'package:unicorndial/unicorndial.dart';

class FoodexList extends StatefulWidget {
  final List<FoodexItemEntity> items;

  FoodexList({
    @required this.items,
  });

  @override
  _FoodexListState createState() => _FoodexListState();
}

class _FoodexListState extends State<FoodexList> {
  List<int> _monthFilter = [];
  List<int> _timeFilter = [];
  String _nameFilter;

  @override
  Widget build(BuildContext context) {
    final List<FoodexItemEntity> filteredItems = this._getFilteredItems();
    return Scaffold(
      body: Column(
        children: <Widget>[
          this._buildFilter(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                final FoodexItemEntity current = filteredItems[index];
                return FoodexItem(
                  item: current,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: UnicornDialer(
        parentButton: Icon(Icons.search),
        childButtons: _buildMenu(),
      ),
    );
  }

  Widget _buildFilter() {
    if (this._monthFilter.length == 0 &&
        this._timeFilter.length == 0 &&
        this._nameFilter == null) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 3.0,
            children: this._buildFilters(),
          ),
          OutlineButton(
            child: CoreLocalizations.of(context).getText('reset-filter'),
            onPressed: () {
              this.setState(() {
                this._monthFilter = [];
                this._timeFilter = [];
                this._nameFilter = null;
              });
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilters() {
    final List<Widget> filters = [];
    filters.add(Icon(Icons.opacity));
    filters.addAll(this._monthFilter.map(
          (int month) => this._buildChip(
            SmashLocalizations.of(context).getMonthText(month),
          ),
        ));
    filters.addAll(this._timeFilter.map(
          (int hour) => this._buildChip(
            SmashLocalizations.of(context).getHourText(hour),
          ),
        ));

    if (this._nameFilter != null) {
      filters.add(this._buildChip(
        Text(this._nameFilter),
      ));
    }
    return filters;
  }

  Widget _buildChip(Widget label) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      label: label,
    );
  }

  List<UnicornButton> _buildMenu() {
    return <UnicornButton>[
      UnicornButton(
        labelText: SmashLocalizations.of(context).getString('accord-name'),
        hasLabel: true,
        labelHasShadow: false,
        currentButton: FloatingActionButton(
          mini: true,
          child: Icon(Icons.youtube_searched_for),
          onPressed: () async {
            final String filter = await openInputDialog(
              context,
              title: SmashLocalizations.of(context)
                  .getString('accord-name-search'),
              label:
                  SmashLocalizations.of(context).getString('accord-name-label'),
            );
            if (filter != null && filter.length > 0) {
              setState(() {
                this._nameFilter = filter;
              });
            }
          },
        ),
      ),
      UnicornButton(
        labelText: SmashLocalizations.of(context).getString('current-time'),
        hasLabel: true,
        labelHasShadow: false,
        currentButton: FloatingActionButton(
          mini: true,
          child: Icon(Icons.alarm),
          onPressed: () {
            final DateTime now = DateTime.now();
            this.setState(() {
              this._monthFilter = [now.month];
              this._timeFilter = [now.hour == 0 ? 24 : now.hour];
            });
          },
        ),
      ),
    ];
  }

  List<FoodexItemEntity> _getFilteredItems() {
    if (this._monthFilter.length == 0 &&
        this._timeFilter.length == 0 &&
        this._nameFilter == null) {
      return widget.items;
    }

    List<FoodexItemEntity> items = [];
    for (final item in widget.items) {
      bool timeOk = this._timeFilter.length == 0;
      bool monthOk = this._monthFilter.length == 0;
      bool nameOk = this._nameFilter == null;

      if (this._nameFilter != null) {
        final String zhName = foodexLocalizationChinese[item.name];
        final String enName = foodexLocalizationEnglish[item.name];

        if (zhName.indexOf(this._nameFilter) != -1 ||
            enName.indexOf(this._nameFilter) != -1 ||
            item.name.indexOf(this._nameFilter) != -1) {
          nameOk = true;
        }
      }

      for (final hour in this._timeFilter) {
        if (item.hours.indexOf(hour) != -1) {
          timeOk = true;
        }
      }
      for (final month in this._monthFilter) {
        if (item.northernMonths.indexOf(month) != -1) {
          monthOk = true;
        }
      }
      if (timeOk && monthOk && nameOk) {
        items.add(item);
      }
    }
    return items;
  }
}
