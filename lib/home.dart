import 'package:flutter/material.dart';
import 'easy.dart';
import 'medium.dart';
import 'hard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
      ),

      body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text('Improve your math skills!', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width:  3,
                    ),
                  ),
                  child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.calculate, size: 150, color: Colors.deepPurple),
                                ],
                              ),
                              Column(
                                  children: [
                                    Text('Today\'s Challenge', style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
                                    SizedBox( height: 30),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepPurple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        onPressed:() {Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const Easy()),
                                        );//push
                                        }, child: Text('Level: Easy', style: TextStyle(fontSize: 20.0))),
                                  ])
                            ]),
                        SizedBox(height: 20)
                      ]
                  )
              ),
              SizedBox(height: 40),
              Text('Choose Your Level ', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
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
                    onPressed:() {Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Easy()),
                    );//push
                    }, child: Text('Easy Level', style: TextStyle(fontSize: 24.0))),
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
                    onPressed:() {Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Medium()),
                    );//push
                    }, child: Text('Medium Level', style: TextStyle(fontSize: 24.0))),
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
                    onPressed:() {Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Hard()),
                    );//push
                    }, child: Text('Hard Level', style: TextStyle(fontSize: 24.0))),
              ),
            ],
          )
      ),
    );
  }
}
