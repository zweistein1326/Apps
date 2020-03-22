import 'package:flutter/material.dart';
import 'package:mark_it/screens/locations_screen.dart';
import './screens/home_page.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
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
        },
      ),
    );
  }
}
