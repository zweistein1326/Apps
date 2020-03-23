import 'package:flutter/material.dart';
import 'package:mark_it/screens/locations_screen.dart';
import 'package:mark_it/screens/offers_screen.dart';
import 'package:mark_it/screens/product_detail_screen.dart';
import './screens/home_page.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

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
        )
      ],
      child: MaterialApp(
        title: 'Name',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
        ),
        home: HomePage(),
        routes: {
          LocationsScreen.routeName: (_) => LocationsScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          OffersScreen.routeName: (_) => OffersScreen(),
        },
      ),
    );
  }
}
