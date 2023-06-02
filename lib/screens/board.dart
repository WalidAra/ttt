import 'package:flutter/material.dart';
import '../models/model.dart';
import '../components/status.dart';
import '../components/fields.dart';
import '../components/resetBtn.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {

  void reset() {
    setState(() {
      resetGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Status(player: xTurn.player , text:  xTurn.text),
                Status(player: oTurn.player , text: oTurn.text),
              ],
            ),
            FieldBoarde(),
            ResetButton(reset: reset),
          ],
        ),
      ),
    );
  }
}
