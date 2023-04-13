import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

//real class MyApp will return a 'fake class' widget MyAppState, able to change state
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      //anonymous function
      _questionIndex = _questionIndex + 1;
      _questionIndex > 2 ? _questionIndex = 0 : _questionIndex;
    });

    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s your favorite platform streaming?',
        'answers': ['Netflix', 'HBO MAX', 'PrimeVideo', 'Disney Plus']
      },
    ]; //the cruly brackets are a map, a data structure that allows you to store data in key-value pairs. The key is the questionText and the value is the answers. The square brackets are a list, a data structure that allows you to store data in a sequence. The list contains the maps.

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My firt App'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList(), //... is the spread operator. It allows you to pull all the values out of a list and add them to another list as individual values. toList() is a method that converts a list of widgets into a list of objects.
            ], //children is a list of widgets
          )),
    );
  }
}
