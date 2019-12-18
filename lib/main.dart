import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //state object maintains reference to the widgets for the widgets maintaining state
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //final- runtime constant, const- compile time constant. var q = const [ means q can change, point to something else but the list value stored in a memory location cannot
    //List of maps
    {
      //Map begins
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 9},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Lion', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your favorite TV Show?',
      'answers': [
        {'text': 'Friends', 'score': 1},
        {'text': 'Sherlock', 'score': 3},
        {'text': 'Game of Thrones', 'score': 6},
        {'text': 'Breaking Bad', 'score': 8}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kartik\'s First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
