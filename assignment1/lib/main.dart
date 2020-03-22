import 'package:assignment1/TextControl.dart';
import 'package:flutter/material.dart';
import './T.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final randomText=const ['Hello','Belo','Celo'];

  int textIndex=0;

  void changeText(){
    setState(() {if(textIndex==0){
      textIndex++;
    }else{
      textIndex--;
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title:Text('assignment1')),
      body: Container(child: Column(children: <Widget>[
        T(randomText[textIndex]),
        TextControl(changeText),
      ],) ,),
    ));
  }
}
