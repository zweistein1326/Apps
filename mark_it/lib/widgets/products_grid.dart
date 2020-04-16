import 'package:flutter/material.dart';
import '../providers/products.dart';
import './products_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final String shopTitle;

  ProductsGrid(this.shopTitle) {
    print(shopTitle);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(
      context,
    ).items(shopTitle);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5 / 1 ,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //create : (_) => products[i]
        value: products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageURL,
            ),
      ),
      itemCount: products.length,
    );
  }
}
