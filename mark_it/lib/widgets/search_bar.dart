import 'package:flutter/material.dart';
import 'package:mark_it/providers/products.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Search Product'),
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                products.checkSubString(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
