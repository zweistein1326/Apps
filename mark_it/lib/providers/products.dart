import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  final Map<String, List<Product>> _items = {
    'ELT': [
      Product(
        id: 'p1',
        title: 'Maggi',
        description: 'Aapki apni maggi',
        price: 12.99,
        imageURL:
            'https://images-na.ssl-images-amazon.com/images/I/71OPa99tUPL._SL1461_.jpg',
      ),
      Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageURL:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      ),
      Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageURL:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      ),
      Product(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageURL:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      ),
    ]
  };

  var shop = 'ELT';

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    print([..._items[shop]]);
    return [..._items[shop]]
        .where((prodItem) => prodItem.hasSubString)
        .toList();
  }

  // List<Product> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }
  // // void showFavoritesOnly() {
  // //   _showFavoritesOnly = true;
  // //   notifyListeners();
  // // }

  // // void showAll() {
  // //   _showFavoritesOnly = false;
  // //   notifyListeners();
  // // }

  // void checkSubString(String subString) {
  //   _items.forEach((prodItem) {
  //     prodItem.containsSubstring(subString);
  //     print(prodItem.hasSubString);
  //   });
  //   notifyListeners();
  // }

  // void addProduct() {
  //   // _items.add(value);
  //   notifyListeners();
  // }

  void findByShopTitle(String shopTitle) {
    shop = shopTitle;
    print(shopTitle);
  }

  Product findById(productId) {
    return _items[shop].firstWhere((prod) => prod.id == productId);
  }
}
