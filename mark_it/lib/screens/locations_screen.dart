import 'package:flutter/material.dart';

class LocationsScreen extends StatefulWidget {
  static const routeName = '/Location';

  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  var _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            labelText: 'Location',
          ),
          controller: _locationController,
          onSubmitted: null,
          cursorColor: Colors.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(_locationController.text),
          ),
        ],
      ),
    );
  }
}
