import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;

  // ProductItem(this.id, this.title, this.imageURL);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80,
              width: 80,
              child: Image.network(product.imageUrl, fit: BoxFit.contain),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${product.title}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Text(
                      '${product.description}',
                      softWrap: true,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Text('${product.price}'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.175,
              margin: EdgeInsets.symmetric(horizontal: 2.5),
              child: RaisedButton(
                child: Text('+Add'),
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                },
              ),
            )
          ],
        )
        // child: GridTile(
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pushNamed(
        //         ProductDetailScreen.routeName,
        //         arguments: product.id,
        //       );
        //     },
        //     child: Image.network(product.imageUrl, fit: BoxFit.cover),
        //   ),
        //   footer: GridTileBar(
        //     backgroundColor: Colors.black87,
        //     trailing: IconButton(
        //       icon: Icon(
        //         Icons.shopping_cart,
        //         color: Theme.of(context).accentColor,
        //       ),
        //       onPressed: () {
        //         cart.addItem(product.id, product.price, product.title);
        //         Scaffold.of(context).hideCurrentSnackBar();
        //         Scaffold.of(context).showSnackBar(
        //           SnackBar(
        //             content: Text(
        //               'Added ${product.title} to Cart',
        //             ),
        //             duration: Duration(seconds: 2),
        //             action: SnackBarAction(
        //               label: 'Open Cart',
        //               onPressed: () {
        //                 Navigator.of(context)
        //                     .popAndPushNamed(CartScreen.routeName);
        //               },
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //     title: Text(
        //       '\$${product.price} \n ${product.title}',
        //       style: TextStyle(fontSize: 13),
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),
        );
  }
}
