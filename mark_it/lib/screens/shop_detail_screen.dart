import 'package:flutter/material.dart';
import 'package:mark_it/widgets/products_grid.dart';
import 'package:mark_it/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import '../providers/shops.dart';

class ShopDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // final String imageUrl;
  // ProductDetailScreen(this.title,this.price,this.imageUrl);
  static const routeName = '/shop-detail';
  @override
  Widget build(BuildContext context) {
    final shopId = ModalRoute.of(context).settings.arguments as String;
    final loadedShop = Provider.of<Shops>(
      context,
    ).findById(shopId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedShop.title),
      ),
      body: Column(
        children: <Widget>[
          SearchBar(),
          SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:10),
            height: MediaQuery.of(context).size.height * 0.72,
            child: ProductsGrid(loadedShop.title),
          ),
        ),
          
        ],
      ),
    );
  }
}
