import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rollingdicegame/styled_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  var isSelectedNumber = 0;
  var result='';
  void rollDice() {

    setState(() {
      currentDiceRoll = Random().nextInt(6) + 1;
    });

    if(isSelectedNumber==currentDiceRoll){
      result='Congratulation ! You win';
      //you win
    }else {
      result='Oops ! You lose';

      //you lose
    }
  }

  Widget numberCard(  number) {
    return Padding(
        padding:   EdgeInsets.all(8.0),
        child: InkWell(onTap:(){isSelectedNumber=number;} ,child: Container(
            width: isSelectedNumber==number?50:40,
            height: isSelectedNumber==number?50:40,
            decoration: BoxDecoration(
                color: isSelectedNumber==number?Colors.yellow:Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8)),
            child: Center(child: StyledText("$number", Colors.black87))),
        )
    );
  }
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText("Select one number", Colors.white),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            numberCard(1),
            numberCard(2),
            numberCard(3),
            numberCard(4),
            numberCard(5),
            numberCard(6),
          ],
        ),
        SizedBox(height: 10,),
        Image.asset(
          "assets/images/dice-$currentDiceRoll.png",
          width: 200,
        ),
        TextButton(onPressed: rollDice, child: StyledText("Roll Dice", Colors.white)),
         SizedBox(height: 60,) ,
         StyledText(result, Colors.orange),
        SizedBox(height: 60,) ,
        TextButton(onPressed: (){
          setState(() {
            isSelectedNumber=0;
            result="";
          });
        }, child: StyledText("Reset", Colors.white)),
      ],
    );
  }


}
