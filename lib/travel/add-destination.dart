import 'package:flutter/material.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class AddDestination extends StatefulWidget {
  @override
  _AddDestinationState createState() => _AddDestinationState();
}

class _AddDestinationState extends State<AddDestination> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoreLocalizations.of(context).getText('create-destination'),
      ),
      body: ListView(
        children: <Widget>[
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
                RaisedButton(
                  child: CoreLocalizations.of(context).getText('submit'),
                  onPressed: this._submit,
                ),
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
          this._data[titleFieldName] = value;
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
          this._data[descriptionFieldName] = value;
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
        ),
        onSaved: (String value) {
          this._data[accessCodeFieldName] = value;
        },
        validator: (String value) {
          if (value.length > 0) {
            return null;
          }
          return this._buildRequiredMessage(context, accessCodeFieldName);
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

  void _submit() {
    this._formKey.currentState.save();
    if (this._formKey.currentState.validate()) {
      print(this._data);
    }
  }
}
