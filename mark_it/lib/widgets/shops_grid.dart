import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shops.dart';
import './shop_item.dart';

class ShopsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopsData = Provider.of<Shops>(context);
    final shops = shopsData.shops;
    print(shops);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //create : (_) => products[i]
        value: shops[index],
        child: ShopItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageURL,
            ),
      ),
      itemCount: shops.length,
    );
  }
}
