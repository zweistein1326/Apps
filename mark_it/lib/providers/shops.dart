import 'package:flutter/foundation.dart';
import './shop.dart';

class Shops with ChangeNotifier {
  final List<Shop> _shops = [
    Shop(
      shopName: 'ELT',
      id: 's1',
      imageUrl: 'https://i.ytimg.com/vi/JC0VOvxJLi0/hqdefault.jpg',
    ),
    
  ];

  List<Shop> get shops {
    return [..._shops];
  }

  Shop findById(shopId) {
    return _shops.firstWhere((shop) => shop.id == shopId);
  }
}
