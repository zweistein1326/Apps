import 'package:flutter/material.dart';

class OffersItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Text('You do not have any offers available'),
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Offer 1'),
        ),
      ),
    );
  }
}
