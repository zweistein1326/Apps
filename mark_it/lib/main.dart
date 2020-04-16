import 'package:flutter/material.dart';
import 'package:mark_it/screens/home_screen.dart';
import 'package:mark_it/screens/product_details_screen.dart';
import 'package:mark_it/screens/shop_details_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './screens/login_screen.dart';
import './providers/shops.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Shops(),
        ),
        ChangeNotifierProvider.value(value: Cart())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
        ),
        home: LoginScreen(),
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          ShopDetailsScreen.routeName: (_) => ShopDetailsScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
        },
      ),
    );
  }
}
