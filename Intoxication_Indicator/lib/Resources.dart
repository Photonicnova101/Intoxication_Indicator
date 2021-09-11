
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class Resources extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(

      ),
      body: 
      
      Column(
        
        
        children: [
          Row(
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
                  )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                child:
                TextButton(child: Text("Alcoholism:Symptoms and signs of abuse"),
              onPressed: () async{
                if (await canLaunch("https://americanaddictioncenters.org/alcoholism-treatment/symptoms-and-signs") == true) {
                          launch("https://americanaddictioncenters.org/alcoholism-treatment/symptoms-and-signs");
                       } else {
                          print("Can't launch URL");
                       }
              },)
              )
              
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                child:
                TextButton(child: Text("What is Intoxication"),
              onPressed: () async{
                if (await canLaunch("https://www.medicalnewstoday.com/articles/327202#what-is-alcohol-intoxication") == true) {
                          launch("https://www.medicalnewstoday.com/articles/327202#what-is-alcohol-intoxication");
                       } else {
                          print("Can't launch URL");
                       }
              },)
              )
              
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Colors.white),
                child:
                TextButton(child: Text("Symptoms of Drunkenness"),
                onPressed: () async{
                if (await canLaunch("https://www.healthline.com/health/what-does-it-feel-like-to-be-drunk") == true) {
                          launch("https://www.healthline.com/health/what-does-it-feel-like-to-be-drunk");
                       } else {
                          print("Can't launch URL");
                       }
              },)
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}