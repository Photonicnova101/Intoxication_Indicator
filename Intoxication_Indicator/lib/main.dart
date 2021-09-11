import 'package:flutter/material.dart';

import 'package:intoxication_indicator/quiz.dart';
import 'quiz.dart';
import 'Resources.dart';
import 'TTS.dart';


void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intoxication Indicator',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
          title: Text("Intoxication Indicator"),
        ),
      body: Column(
        
        children: <Widget>[
          Row(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                    child: TextButton(onPressed:(){ 
                    Navigator.of(context).push(
                    
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                  }, 
                  child: Text("Home",style: TextStyle(color: Colors.black),)),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                    child:
                    TextButton(onPressed:(){ 
                    Navigator.of(context).push(
                    
                    MaterialPageRoute(
                      builder: (context) => Resources(),
                    ),
                  );
                  }, 
                  child: Text("Resources",style: TextStyle(color: Colors.black)))
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                    child: TextButton(onPressed:(){ 
                    Navigator.of(context).push(
                    
                    MaterialPageRoute(
                      builder: (context) => Speechrecog(),
                    ),
                  );
                  }, 
                  child: Text("TTS test",style: TextStyle(color: Colors.black))),
                  )
                  
                ],
              ),
            ],),

          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: SizedBox(child:Center(
              child: Image.asset('images/front_beermug.png', height: 300, ),),),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.cyan),color: Colors.red),
            height: 100,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child:TextButton(
              child: Text("Take the Quiz",style: TextStyle(fontSize: 30, color: Colors.white,),), 
              onPressed: () {
            Navigator.of(context).push(
                  // With MaterialPageRoute, you can pass data between pages,
                  // but if you have a more complex app, you will quickly get lost.
                  MaterialPageRoute(
                    builder: (context) => QuizPageOneState(),
                  ),
                );
        },)
          )
        ],

      ),

    );
  }
}