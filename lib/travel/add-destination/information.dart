import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';
import 'package:seafood_crossing/i18n/travel/localizations.dart';
import 'package:seafood_crossing/travel/category/data.dart';
import 'package:seafood_crossing/travel/category/enum.dart';
import 'package:seafood_crossing/travel/repository/create.dart';

class AddDestinationInformation extends StatefulWidget {
  final DestinationCategory category;

  AddDestinationInformation({
    @required this.category,
  });

  @override
  _AddDestinationInformationState createState() =>
      _AddDestinationInformationState();
}

class _AddDestinationInformationState extends State<AddDestinationInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = {};
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final TravelLocalizations travelLocalizations =
        TravelLocalizations.of(context);

    final String titleKey = destinationDestinationTitle[widget.category];
    final String subtitleKey = destinationDestinationSubtitle[widget.category];
    final IconData icon = destinationDestinationIcon[widget.category];

    return Scaffold(
      appBar: AppBar(
        title: travelLocalizations.getText('destination-details'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(icon),
              title: travelLocalizations.getText(titleKey),
              subtitle: travelLocalizations.getText(subtitleKey),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Form(
                  key: this._formKey,
                  child: Column(
                    children: this._buildFormFields(context),
                  ),
                ),
                this._buildSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFormFields(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    const String titleFieldName = 'title';
    const String descriptionFieldName = 'description';
    const String accessCodeFieldName = 'access-code';

    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: coreLocalizations.getString(titleFieldName),
          hintText: coreLocalizations.getString(titleFieldName + '-hint'),
        ),
        onSaved: (String value) {
          this._data['title'] = value;
        },
        validator: (String value) {
          if (value.length > 0) {
            return null;
          }
          return this._buildRequiredMessage(context, titleFieldName);
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: coreLocalizations.getString(descriptionFieldName),
          hintText: coreLocalizations.getString(descriptionFieldName + '-hint'),
        ),
        onSaved: (String value) {
          this._data['description'] = value;
        },
        validator: (String value) {
          if (value.length > 0) {
            return null;
          }
          return this._buildRequiredMessage(context, descriptionFieldName);
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: coreLocalizations.getString(accessCodeFieldName),
          hintText: coreLocalizations.getString(accessCodeFieldName + '-hint'),
          helperText:
              coreLocalizations.getString(accessCodeFieldName + '-helper'),
        ),
        onSaved: (String value) {
          this._data['accessCode'] = value;
        },
        validator: (String value) {
          if (value.length == 0) {
            return this._buildRequiredMessage(context, accessCodeFieldName);
          }

          final RegExp pattern = RegExp(r'^[A-Za-z0-9]{5}$');

          if (pattern.hasMatch(value)) {
            return null;
          }

          return this
              ._buildPatternNotMatchedMessage(context, accessCodeFieldName);
        },
      ),
    ];
  }

  String _buildRequiredMessage(BuildContext context, String fieldName) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return coreLocalizations.getString(fieldName) +
        ' ' +
        coreLocalizations.getString('is-required');
  }

  String _buildPatternNotMatchedMessage(
      BuildContext context, String fieldName) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return coreLocalizations.getString(fieldName) +
        ' ' +
        coreLocalizations.getString('has-invalid-pattern');
  }

  Widget _buildSubmitButton() {
    if (this._loading) {
      return RaisedButton(
        child: CoreLocalizations.of(context).getText('submitting'),
        onPressed: null,
      );
    }
    return RaisedButton(
      child: CoreLocalizations.of(context).getText('submit'),
      onPressed: this._submit,
    );
  }

  Future<void> _submit() async {
    this._formKey.currentState.save();
    if (this._formKey.currentState.validate()) {
      this.setState(() {
        this._loading = true;
      });
      final CreateRepositoryResponse response = await createRepository(
        category: widget.category,
        title: this._data['title'],
        description: this._data['description'],
        accessCode: this._data['accessCode'],
      );
      if (response != null) {
        Navigator.pop(context);
      }
    }
  }
}
