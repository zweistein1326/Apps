import 'package:flutter/foundation.dart';
import './product.dart';

class Shop with ChangeNotifier {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final List<String> locations;
  final List<Product> products;

  Shop({
    @required this.id,
    @required this.title,
    @required this.category,
    this.imageUrl,
    @required this.locations,
    this.products,
  });
}
