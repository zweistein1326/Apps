import 'package:flutter/material.dart';
import '../providers/products.dart';
import './product_item.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  ProductsGrid(this.products) {
    print(products[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
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
