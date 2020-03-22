import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 0}
      ]
    },
    {
      'questionText': "What's your favorite animal",
      'answers': [
        {'text': 'Pigoen', 'score': 0},
        {'text': 'Lion', 'score': 5},
        {'text': 'Snake', 'score': 10},
        {'text': 'Rabbit', 'score': 2}
      ]
    },
    {
      'questionText': "What's your favorite place",
      'answers': [
        {'text': 'USA', 'score': 2},
        {'text': 'India', 'score': 10},
        {'text': 'Hong Kong', 'score': 5},
        {'text': 'Germany', 'score': 0}
      ]
    },
  ];
  var _questionIndex = 0;

  var _totalscore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalscore=0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(
                totalscore:_totalscore,
                resetHandler:_resetQuiz
              )),
    );
  }
}

//KEEP ONE WIDGET PER FILE
