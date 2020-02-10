import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Question.dart';

void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> icons = [];
  int questionNumber = 0;
  List<Question> questions = quizBrain.questions;

  void reset(){
    setState(() {
      icons.clear();
      questionNumber = 0;
    });
  }

  void addToIcons(Type type) {
    if (questionNumber > questions.length - 2) {
      int correctAnswers = icons.where((icon) => icon.icon == Icons.check).toList().length;
      Alert(context: context, title: "Game Over", desc: "You got $correctAnswers correct!", buttons: [
        DialogButton(
          child: Text('Cool',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            this.reset(),
            Navigator.pop(context)
          },
          width: 120,

        )
      ]).show();
      return;
    } else {
      questionNumber++;
    }
    switch (type) {
      case Type.check:
        setState(() {
          icons.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        });
        break;
      case Type.close:
        setState(() {
          icons.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        });
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool ans = quizBrain.getQuestion(questionNumber).answer;
    void evaluateAnswer(SubmitType type) {
      switch (type) {
        case SubmitType.True:
          if (ans == true) {
            addToIcons(Type.check);
          } else {
            addToIcons(Type.close);
          }
          break;
        case SubmitType.False:
          if (ans == false) {
            addToIcons(Type.check);
          } else {
            addToIcons(Type.close);
          }
          break;
        default:
          return;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                evaluateAnswer(SubmitType.True);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                evaluateAnswer(SubmitType.False);
              },
            ),
          ),
        ),
        Row(
            children: icons.map((icon) {
          return icon;
        }).toList())
      ],
    );
  }
}

enum Type { close, check }
enum SubmitType { True, False }

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
