import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dicee', style: TextStyle(color: Colors.white),),
            ],
          ),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  late int leftDiceNumber;
  late int rightDiceNumber;
  late int diceNumber;

  int randomNumber(){
      setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
    return diceNumber;
  }

  void dualButtonEffect(){
    leftDiceNumber = randomNumber();
    rightDiceNumber = randomNumber();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(children: <Widget>[
        Expanded (child: TextButton(onPressed: () {
            dualButtonEffect();
        },
        child: Image.asset('images/dice$leftDiceNumber.png'),
        ),
        ),
        Expanded (child: TextButton (onPressed: () { 
            dualButtonEffect();
         },
        child: Image.asset('images/dice$rightDiceNumber.png'),
        ),
        ),
      ],),
    );
  }
}