import 'package:flutter/material.dart';
import 'package:mark_it/providers/product.dart';
import 'package:provider/provider.dart';
import './shop.dart';
import './products.dart';

class Shops with ChangeNotifier {
  static Products products = new Products();
  final List<Shop> _shops = [
    Shop(
        id: 'p1',
        title: 'ELT',
        category: 'Grocery',
        imageUrl:
            'https://i.ytimg.com/vi/JC0VOvxJLi0/hqdefault.jpg',
        locations: ['Eldeco', 'SilverCity'],
        products: products.items),
  ];
  List<Shop> get shops {
    return [..._shops];
  }

  Shop findById(shopId) {
    return _shops.firstWhere((shop) => shop.id == shopId);
  }
}
