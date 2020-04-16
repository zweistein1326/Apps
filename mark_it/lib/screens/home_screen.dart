import 'package:flutter/material.dart';
import '../widgets/shops_grid.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:10),
            height: MediaQuery.of(context).size.height * 0.72,
            child: ShopsGrid(),
          ),
        ),
      ],
    ));
  }
}
