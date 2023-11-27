import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'scoreboard.dart';

class Hard extends StatefulWidget {
  const Hard({Key? key}) : super(key: key);

  @override
  State<Hard> createState() => _HardState();
}

class _HardState extends State<Hard> {
  int score = 0;
  int lives = 7;
  int timerCount = 60*3;
  String level = "";
  late Timer timer;
  late MathEquation currentEquation;
  late List<int> options;
  int? selectedAnswer;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    generateNewEquation();
    // Start the timer
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timerCount > 0) {
          timerCount--;
        } else {
          endGame();
        }
      });
    });
  }

  void generateNewEquation() {
    // Generate a new math equation
    currentEquation = MathEquation.generateRandomEquation();

    // Shuffle the options
    options = currentEquation.generateOptions();

    selectedAnswer = null;
  }

  void checkAnswer() {
    if (selectedAnswer == null) {
      // Show a warning if no option is selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning!"),
            content: Text("Please choose an option before submitting."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Exit the method if no option is selected
    }

    if (selectedAnswer == currentEquation.correctAnswer) {
      // Correct answer
      setState(() {
        score++;
      });
    } else {
      // Incorrect answer
      setState(() {
        if (lives > 1) {
          lives--;
        } else {
          endGame();
        }
      });
    }

    // Move to the next question
    generateNewEquation();
  }

  void endGame() {

    // Cancel the timer
    timer.cancel();

    // Navigate to the scoreboard page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreBoard(
          score: score,
          totalQuestions: (score + (lives+7))-1,
          level: "Hard Level",
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medium Level'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Score: $score', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
                ],
              ),
              Column(
                children: [
                  Text('$timerCount', style: TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Text('Lives: $lives', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(currentEquation.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Column(
            children: options.map((option) {
              return Row(
                children: [
                  Radio(
                    value: option,
                    groupValue: selectedAnswer,
                    onChanged: (int? value) {
                      setState(() {
                        selectedAnswer = value;
                      });
                    },
                  ),
                  Text(option.toString(), style: TextStyle(fontSize: 40)),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 30),
          Container(
              width: 300.0,
              height: 50.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed:() {checkAnswer();}, child: Text('Submit', style: TextStyle(fontSize: 24.0)))
          ),
        ],
      ),
    );
  }
}


class MathEquation {
  late int number1;
  late int number2;
  late String operator;
  late int correctAnswer;

  MathEquation(this.number1, this.number2, this.operator, this.correctAnswer);

  static MathEquation generateRandomEquation() {
    final random = Random();
    int n1 = random.nextInt(51) + 50; // Random number between 50 and 100
    int n2 = random.nextInt(51) + 50;
    String operator = ['+', '-', '*', '/'][random.nextInt(4)]; // Random operator

    int correctAnswer;
    switch (operator) {
      case '+':
        correctAnswer = n1 + n2;
        break;
      case '-':
        correctAnswer = n1 - n2;
        break;
      case '*':
        correctAnswer = n1 * n2;
        break;
      case '/':
      // Ensure non-zero divisor for division
        correctAnswer = n2 != 0 ? (n1 ~/ n2) : 0;
        break;
      default:
        correctAnswer = 0;
    }

    return MathEquation(n1, n2, operator, correctAnswer);
  }

  List<int> generateOptions() {
    // Generate a list of random options including the correct answer
    final random = Random();
    List<int> options = [correctAnswer];

    while (options.length < 4) {
      int option = random.nextInt(101) + 50; // Random number between 100 and 50
      if (!options.contains(option)) {
        options.add(option);
      }
    }

    options.shuffle();
    return options;
  }

  @override
  String toString() {
    return '$number1 $operator $number2 = ?';
  }
}
