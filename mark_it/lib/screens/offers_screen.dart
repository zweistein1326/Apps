import 'package:flutter/material.dart';
import '../widgets/offers_item.dart';

class OffersScreen extends StatelessWidget {
  static const routeName = '/offers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body:
          Center(child: Text('No Offers Available at the Moment'),),
    );
  }
}
