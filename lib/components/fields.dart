import 'package:flutter/material.dart';
import '../models/model.dart';

class FieldBoarde extends StatefulWidget {
  const FieldBoarde({super.key});

  @override
  State<FieldBoarde> createState() => _FieldBoardeState();
}

class _FieldBoardeState extends State<FieldBoarde> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if(fields[index].value == '' && game == GameStatus.none){
                printOnBoard(index);
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: Center(
              child: Text(
               fields[index].value,
                style: TextStyle(color: fields[index].color, fontSize: 50),
              ),
            ),
          ),
        );
      },
    );
  }
}
