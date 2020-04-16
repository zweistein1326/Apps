import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop.dart';
import '../screens/shop_details_screen.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ShopDetailsScreen.routeName, arguments: shop.id);
          },
          child: Image.network(shop.imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            shop.shopName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
