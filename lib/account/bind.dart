import 'package:flutter/material.dart';
import 'package:seafood_crossing/account/repository/bind.dart';
import 'package:seafood_crossing/i18n/core/localizations.dart';

class BindAccount extends StatefulWidget {
  @override
  _BindAccountState createState() => _BindAccountState();
}

class _BindAccountState extends State<BindAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _data = {};
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText('bind-account'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              isThreeLine: true,
              leading: Icon(Icons.link),
              title: coreLocalizations.getText('bind-account-title'),
              subtitle: coreLocalizations.getText('bind-account-subtitle'),
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
    const String identifierFieldName = 'account-identifier';

    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.info),
          labelText: coreLocalizations.getString(identifierFieldName),
          hintText: coreLocalizations.getString(identifierFieldName + '-hint'),
        ),
        onSaved: (String value) {
          this._data[identifierFieldName] = value;
        },
        validator: (String value) {
          if (value.length == 0) {
            return this._buildRequiredMessage(context, identifierFieldName);
          }

          final String removeDashed = value.replaceAll('-', '');
          final RegExp pattern = RegExp(r'^[A-Za-z0-9]{33}$');

          if (pattern.hasMatch(removeDashed)) {
            return null;
          }

          return this
              ._buildPatternNotMatchedMessage(context, identifierFieldName);
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

  String _buildPatternNotMatchedMessage(
      BuildContext context, String fieldName) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);
    return coreLocalizations.getString(fieldName) +
        ' ' +
        coreLocalizations.getString('has-invalid-pattern');
  }

  Future<void> _submit() async {
    this._formKey.currentState.save();
    if (this._formKey.currentState.validate()) {
      this.setState(() {
        this._loading = true;
      });

      final String identifier = this._data['account-identifier'];
      final BindAccountRepositoryResponse response =
          await bindAccountRepository(identifier: identifier);
      if (response != null) {
        Navigator.pop(context);
      } else {
        showDialog(
          builder: (BuildContext context) => AlertDialog(
            title: CoreLocalizations.of(context)
                .getText('account-identifier-not-found'),
            content: CoreLocalizations.of(context)
                .getText('account-identifier-not-found-content'),
          ),
          context: context,
        );

        this.setState(() {
          this._loading = false;
        });
      }
    }
  }
}
