import 'package:flutter/material.dart';
import 'home.dart';
import 'easy.dart';
import 'medium.dart';
import 'hard.dart';


class ScoreBoard extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String level;
  const ScoreBoard({Key? key, required this.score, required this.totalQuestions, required this.level}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    void levelCheck(){
      String levelCheck = "";
      levelCheck = level;

      if(levelCheck == "Easy Level"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Easy(),
          ),
        );
      } else if(levelCheck == "Medium Level"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Medium(),
          ),
        );
      } else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Hard(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ScoreBoard'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width:  3,
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text('$level', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Correct Answers: ', style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic)),
                          SizedBox(height: 20),
                          Text('Total Questions: ', style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('$score', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                          Text('$totalQuestions', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 50),
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
                    onPressed:() {
                      levelCheck();
                    }, child: Text('Retry', style: TextStyle(fontSize: 24.0)))
            ),
            SizedBox(height: 20),
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
                    onPressed:() {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }, child: Text('Back to Home', style: TextStyle(fontSize: 24.0)))
            ),
          ],
        ),
      ),
    );
  }
}
