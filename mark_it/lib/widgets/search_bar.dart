import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Search Product'),
              textInputAction: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}
