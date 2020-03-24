import 'package:flutter/material.dart';
import 'package:mark_it/providers/products.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Form(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            alignment: Alignment.center,
            child: TextFormField(
              controller: _searchController,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Search Product',
                labelStyle: TextStyle(fontSize: 10),
                suffix: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    _searchController.clear();
                    products.checkSubString('');
                  },
                ),
              ),
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                products.checkSubString(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
