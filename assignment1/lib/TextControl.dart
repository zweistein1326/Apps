import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function clickHandler;

  TextControl(this.clickHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('Change Text'),
        textColor: Colors.blue,
        onPressed: clickHandler,
      ),
    );
  }
}
