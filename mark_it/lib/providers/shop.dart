import 'package:flutter/foundation.dart';

class Shop with ChangeNotifier {
  final String shopName;
  final String id;
  final String imageUrl;

  Shop({@required this.shopName, @required this.id, this.imageUrl});
}
