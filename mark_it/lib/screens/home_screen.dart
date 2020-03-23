import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/products_grid.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        SearchBar(),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ProductsGrid(),
        ),
      ],
    ));
  }
}
