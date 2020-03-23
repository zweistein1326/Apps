import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageURL;
  final String description;
  final String category;
  bool isFavorite;
  bool hasSubString;

  Product(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.description,
      @required this.imageURL,
      this.isFavorite = false,
      this.category,
      this.hasSubString = true});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void containsSubstring(subString) {
    hasSubString=false;
    for (int i = 0; i < title.length - subString.length + 1; i++) {
      print(title.substring(i, i + subString.length));
      if (title.substring(i, i + subString.length).toLowerCase() ==
          subString.toLowerCase()) {
        hasSubString = true;
      }
    }
    notifyListeners();
  }
}
