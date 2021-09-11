
import 'dart:core';
import 'package:flutter/material.dart';

class QuizPageOneState extends StatefulWidget {
  @override
  QuizPageOne createState() => QuizPageOne();
  
}

class QuizPageOne extends State<QuizPageOneState> {
  // ignore: non_constant_identifier_names
  final TimeController = TextEditingController();
  // ignore: non_constant_identifier_names
  final WeightController = TextEditingController();
  // ignore: non_constant_identifier_names
  final ConsumptionController = TextEditingController();
  double a = 0.0;
  double W = 0.0;
  double r = 0.0;
  double H = 0.0;
  


  @override
  Widget build(BuildContext context) {
    double bloodAlcoholContent = ((a*5.14)/(W*r))-(0.015*H );
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
          title: Text("Intoxication Indicator"),
        ),
      body: ListView(
        children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Gender", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
        ],
      ),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(

            children: [
              SizedBox(child: TextButton(child: Text("Male", style: TextStyle(fontSize: 20, color: Colors.white)),onPressed:(){
                setState(() {
                  r = 0.73;
                });
              },),)
            ],
          ),
          Column(
            
            children: [
              SizedBox(child: TextButton(child: Text("Female",style: TextStyle(fontSize: 20, color: Colors.white)),onPressed:(){
                setState(() {
                  r = 0.66;
                });
              },),)
            ],
          ),
        ],
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Consumption (___oz)", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(width:300,child:
                  TextField(
                    controller: ConsumptionController,
                    onSubmitted: (text){
                      setState(() {
                        a = double.parse(ConsumptionController.text)*0.05;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder() ),
                ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Weight (___lbs)", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(width:300,child:
                  TextField(
                    controller: WeightController,
                    onSubmitted: (text){
                      setState(() {
                        W = double.parse(WeightController.text);
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder() ),
                ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time since first drink(Hours)", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(width:300,child:
                  TextField(
                    controller: TimeController,
                    onSubmitted: (text){
                      setState(() {
                        H = double.parse(TimeController.text);
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder() ),
                ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your BAC% Level: ", style:TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bloodAlcoholContent.toString(), style:TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold))
          ],
        ),
      
       
        ],
      )
      
    );
  }
}

//void calculation(){
  //var BAC = (A*5.14)/(W*r) - .0.15*H
//}
//BAC calculation
//%BAC = (A x 5.14/W x r) – .015 x H