import 'package:flutter/material.dart';

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
        title: Text('1'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Form(
                  key: this._formKey,
                  child: Column(
                    children: this._buildFormFields(),
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: this._submit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFormFields() {
    return <Widget>[
      TextFormField(
        decoration: InputDecoration(
          labelText: 'username',
        ),
        onSaved: (String value) {
          this._data['title'] = value;
        },
        validator: (String value) {
          if (value.length > 0) {
            return null;
          }
          return 'NPOOP';
        },
      ),
    ];
  }

  void _submit() {
    this._formKey.currentState.save();
    if (this._formKey.currentState.validate()) {
      print(this._data);
    }
  }
}
