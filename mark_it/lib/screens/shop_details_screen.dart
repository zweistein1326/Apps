import 'package:flutter/material.dart';
import '../providers/shops.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

class ShopDetailsScreen extends StatelessWidget {
  static const routeName = '/shop-details-screen';
  @override
  Widget build(BuildContext context) {
    final shopId = ModalRoute.of(context).settings.arguments as String;
    final loadedShop = Provider.of<Shops>(context).findById(shopId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedShop.shopName),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.72,
              child: ProductsGrid(loadedShop.shopName),
            ),
          ),
        ],
      ),
    );
  }
}
