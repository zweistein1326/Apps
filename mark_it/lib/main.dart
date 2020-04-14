import 'package:flutter/material.dart';
import 'package:mark_it/screens/locations_screen.dart';
import 'package:mark_it/screens/offers_screen.dart';
import 'package:mark_it/screens/product_detail_screen.dart';
import 'package:mark_it/screens/shop_detail_screen.dart';
import 'package:mark_it/screens/user_screen.dart';
import 'package:mark_it/widgets/shops_grid.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/login_screen.dart';
import './providers/shops.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          // create:(_)=>Products()
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Shops(),
        )
      ],
      child: MaterialApp(
        title: 'Name',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
        ),
        home: LoginScreen(),
        routes: {
          LocationsScreen.routeName: (_) => LocationsScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          OffersScreen.routeName: (_) => OffersScreen(),
          Home.routeName: (_) => Home(),
          UserScreen.routeName: (_) => UserScreen(),
          ShopDetailScreen.routeName: (_) => ShopDetailScreen(),
        },
      ),
    );
  }
}
