import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  bool isFav;

  Product(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.description,
      this.imageUrl,
      this.category,
      this.isFav = false});

  void toggleFavoriteStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
