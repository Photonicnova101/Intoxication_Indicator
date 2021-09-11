import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:avatar_glow/avatar_glow.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Speechrecog extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SpeechrecogState createState() => _SpeechrecogState();
}

class _SpeechrecogState extends State<Speechrecog> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  
  late String _text  = "talk right now";
  double _confidence = 1.0;

  
  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      
      appBar: AppBar(
        title: Text(
            'Speech Recognition: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate:
            _isListening, //once islistening turns true the anime will start
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 20000),
        repeatPauseDuration: const Duration(milliseconds: 20000),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () async{if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }},
          child: Icon(_isListening
              ? Icons.mic
              : Icons.mic_none), //icon diff depending on bool from islistening
        ),
      ), //icon diff depending on bool from islistening
      body: 
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 300,
                child: Text("Repeat the phrase: Peter Piper Picked a Pickled Pepper on a sunny saturday with shelly",style: TextStyle(backgroundColor: Colors.greenAccent,color:Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
        )
      ]),
          Row(children: [
            Container(
                margin: EdgeInsets.only(top:30),
                width: 300,
                child: Text(_text,style: TextStyle(backgroundColor: Colors.cyan,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        )
          ],)
        ],
      )
      
      );
  }

  
}