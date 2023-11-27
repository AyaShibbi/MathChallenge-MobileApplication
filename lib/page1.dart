import 'package:flutter/material.dart';
import 'home.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Challenge'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
          child: Column(
              children: [
                SizedBox(height: 100.0),
                Text('Test your math skills', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                Text('at different levels', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                SizedBox(height: 40.0),
                Image(
                  image: AssetImage('images/page1_illustration.png'),
                  height: 300.0,
                  width: 300.0,
                ),
                SizedBox(height: 40.0),
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
                        onPressed:() {Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Home()),
                        );//push
                        }, child: Text('Start testing', style: TextStyle(fontSize: 24.0)))
                ),
              ]
          )
      ),
    );
  }
}
