import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[800],
        ),
        body: MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var chosenImage = 1;
  void startRoll() {
    var end = DateTime.now().add(Duration(seconds: 5));
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if ((DateTime.now().difference(end)) > Duration(seconds: 0)) {
        timer.cancel();
      } else {
        setState(() {
          chosenImage = Random().nextInt(5) + 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            startRoll();
          },
          child: Image(
            image: AssetImage('images/ball$chosenImage.png'),
          ),
        ),
      ),
    );
  }
}
