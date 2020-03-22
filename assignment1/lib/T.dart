import 'package:flutter/material.dart';

class T extends StatelessWidget {
  final String recievedText;

  T(this.recievedText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(recievedText),
    );
  }
}
