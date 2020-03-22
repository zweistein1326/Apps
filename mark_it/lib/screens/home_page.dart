import 'package:flutter/material.dart';
import 'package:mark_it/widgets/products_grid.dart';
import '../widgets/offers_location.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OffersLocation(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('User-Name'),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SearchBar(),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ProductsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
