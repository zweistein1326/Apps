import 'package:flutter/material.dart';
import 'package:mark_it/screens/locations_screen.dart';

class OffersLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: FlatButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(LocationsScreen.routeName);
            },
            label: Text(
              'Location',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            icon: Icon(Icons.expand_more, color: Colors.black),
          ),
        ),
        Container(
          child: FlatButton.icon(
            onPressed: () => print('Bye'),
            label: Text(
              'Offers',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            icon: Icon(
              Icons.new_releases,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
