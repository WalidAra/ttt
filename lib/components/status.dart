import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/model.dart';

class Status extends StatefulWidget {
  final String player;
  final String text;

  const Status({Key? key, required this.player, required this.text})
      : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          '${widget.text} ${widget.player}',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
