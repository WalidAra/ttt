import 'package:flutter/material.dart';

class Field {
  String value;
  Color color;

  Field({required this.value, this.color = Colors.white});

  void updateProps(String player) {
    this.value = player;

    if (player == 'X')
      this.color = Colors.blue;
    else if (player == 'O')
      this.color = Colors.red;
    else
      this.color = Colors.white;
  }
}

class Turn {
  String player;
  String text;
  Turn({required this.player, required this.text});

  void updateTurns(String player, String text) {
    this.player = player;
    this.text = text;
  }
}

String swapPlayers(String player) {
  if (player == 'X') {
    player = 'O';
    xTurn.updateTurns('', '');
    oTurn.updateTurns(player, 'Your Turn');
  } else if (player == 'O') {
    player = 'X';
  } else {
    player = 'X';
  }
  return player;
}

enum GameStatus {
  winner,
  draw,
  none,
}

List<Field> fields = List.generate(9, (index) => Field(value: ''));
String player = 'X';
GameStatus game = GameStatus.none;
Turn xTurn = Turn(player: player, text: 'Your Turn');
Turn oTurn = Turn(player: '', text: '');

void printOnBoard(int index) {
  fields[index].value = player;
  fields[index].updateProps(player);
  print(fields[index].value + " " + index.toString());
  player = swapPlayers(player);
  game = checkGameStatus();
}

void resetGame() {
  player = 'X';
  game = GameStatus.none;
  xTurn.updateTurns(player, 'Your Turn');
  oTurn.updateTurns('', '');
  fields.forEach((element) {
    element.value = '';
    element.updateProps('');
  });
}

GameStatus checkGameStatus() {
  List<List<int>> conditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  for (int index = 0; index < conditions.length; index++) {
    int a = conditions[index][0];
    int b = conditions[index][1];
    int c = conditions[index][2];

    String valueA = fields[a].value;
    String valueB = fields[b].value;
    String valueC = fields[c].value;

    if (valueA.isNotEmpty && valueA == valueB && valueA == valueC) {
      game = GameStatus.winner;

      if (player == 'X') {
        xTurn.updateTurns(player, 'Won');
        oTurn.updateTurns('', '');
      } else if (player == 'O') {
        xTurn.updateTurns('', '');
        oTurn.updateTurns(player, 'Won');
      }
    }
  }

  if (!fields.any((field) => field.value.isEmpty)) {
    game = GameStatus.draw;
    xTurn.updateTurns('', 'DRAW');
    oTurn.updateTurns('', 'DRAW');
  }

  return game;
}
