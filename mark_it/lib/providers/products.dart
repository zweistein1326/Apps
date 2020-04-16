import 'package:flutter/foundation.dart';
import './product.dart';

class Products with ChangeNotifier {
  final Map<String, List<Product>> _items = {
    'ELT': [
      Product(
        id: 'p1',
        title: 'Maggi',
        description: 'Aapki apni maggi',
        price: 12.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71OPa99tUPL._SL1461_.jpg',
      ),
      Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      ),
      Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      ),
      Product(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      ),
    ],
    'EasyDay': [
      Product(
        id: 'p1',
        title: 'Maggi',
        description: 'Aapki apni maggi',
        price: 12.99,
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/I/71OPa99tUPL._SL1461_.jpg',
      ),
      Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      ),
      Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      ),
      Product(
        id: 'p4',
        title: 'A Nap',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      ),
    ]
  };
  String shop = '';
  List<Product> items(shopName) {
    shop = shopName;
    return [..._items[shopName]];
  }

  Product findById(prodId) {
    return _items[shop].firstWhere((prod) => prodId == prod.id);
  }
}
