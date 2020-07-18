import 'package:flutter/material.dart';
import '../providers/product.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
        appBar: AppBar(
          // actions: <Widget>[
          //   Consumer<Product>(
          //     builder: (ctx, prod, _) => IconButton(
          //       color: Colors.red,
          //       icon: Icon(prod.isFav ? Icons.favorite : Icons.favorite_border),
          //       onPressed: () {
          //         prod.toggleFavStatus();
          //         print(prod.isFav);
          //       },
          //     ),
          //   ),
          // ],
          title: Text(product.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                product.image,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              child: Text(
                'Price: HK\$${product.price.toString()}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                product.description,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton.icon(
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Add to cart'),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'THIS IS THE SUGGESTED ITEMS CONTAINER',
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ],
            )
          ],
        ));
  }
}
