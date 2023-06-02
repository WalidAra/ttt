
import '../models/model.dart';
import '../screens/board.dart';
import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback reset;

  ResetButton({required this.reset});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: reset,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(20),
        ),
      ),
      child: Text(
        "Reset the game",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
