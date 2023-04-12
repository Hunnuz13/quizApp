import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
  
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

final List<Map<String, Object>> _questions = <Map<String, Object>>[
    {
      'questiontext': 'What\'s  your Faviorte player',
      'answers': [
        {'text': 'Kareem Benzma', 'score': 10},
        {'text': 'Kevin De Bruyne', 'score': 20},
        {'text': 'Mohamed Salah', 'score': 40},
        {'text': 'Bukayo Saka', 'score': 30}
      ],
    },
    {
      'questiontext': 'What\'s  your Faviorte Coach',
      'answers': [
        {'text': 'Carlo Ancelotti', 'score': 10},
        {'text': 'Pep Guardiola', 'score': 30},
        {'text': 'Jurgen klopp', 'score': 20},
        {'text': 'Mikel Arteta', 'score': 40}
      ],
    },
    {
      'questiontext': 'What\'s  your Faviorte Club',
      'answers': [
        {'text': 'Real Madrid', 'score': 30},
        {'text': 'Manchester City', 'score': 10},
        {'text': 'Liverpool', 'score': 20},
        {'text': 'Arsenal', 'score': 40}
      ],
    },
  ];
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}

