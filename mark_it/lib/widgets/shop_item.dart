import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop.dart';
import '../screens/shop_detail_screen.dart';

class ShopItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;

  // ShopItem(this.id, this.title, this.imageURL);
  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ShopDetailScreen.routeName, arguments: shop.id);
          },
          child: Image.network(shop.imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            shop.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
