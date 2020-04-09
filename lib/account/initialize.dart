import 'package:flutter/material.dart';
import 'package:seafood_crossing/account/repository/initialize.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class InitializeAccount extends StatefulWidget {
  @override
  _InitializeAccountState createState() => _InitializeAccountState();
}

class _InitializeAccountState extends State<InitializeAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = {};
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText('initialize-account'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.data_usage),
              title: coreLocalizations.getText('initialize-account-title'),
              subtitle:
                  coreLocalizations.getText('initialize-account-subtitle'),
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
    const String profileFieldName = 'profile-identifier';
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: coreLocalizations.getString(profileFieldName),
          hintText: coreLocalizations.getString(profileFieldName + '-hint'),
        ),
        onSaved: (String value) {
          this._data[profileFieldName] = value;
        },
        validator: (String value) {
          if (value.length > 0) {
            return null;
          }
          return this._buildRequiredMessage(context, profileFieldName);
        },
      ),
    ];
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

  String _buildRequiredMessage(BuildContext context, String fieldName) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return coreLocalizations.getString(fieldName) +
        ' ' +
        coreLocalizations.getString('is-required');
  }

  Future<void> _submit() async {
    this._formKey.currentState.save();
    if (this._formKey.currentState.validate()) {
      this.setState(() {
        this._loading = true;
      });
      final InitializeAccountRepositoryResponse response =
          await initializeAccountRepository(
              profileIdentifier: this._data['profile-identifier']);
      if (response != null) {
        Navigator.pop(context);
      }
    }
  }
}
