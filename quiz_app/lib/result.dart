import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;

  final Function resetHandler;

  Result({this.totalscore, this.resetHandler});

  String get resultPhrase {
    var resultText;
    if (totalscore <= 8) {
      resultText = "You are awesome and innocent";
    } else if (totalscore <= 12) {
      resultText = "Pretty likeable";
    } else if (totalscore <= 16) {
      resultText = 'You are strange';
    } else {
      resultText = "you are bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text('Restart'),
              textColor: Colors.blue,
              onPressed: resetHandler,
            )
          ],
        ),
      ),
    );
  }
}
