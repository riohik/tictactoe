// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/result.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<List<String>> field = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];

  List<List<List<int>>> lines = [
    [
      [0, 0],
      [0, 1],
      [0, 2],
    ], // 横向き
    [
      [1, 0],
      [1, 1],
      [1, 2],
    ],
    [
      [2, 0],
      [2, 1],
      [2, 2],
    ],
    [
      [0, 0],
      [1, 0],
      [2, 0],
    ], // 縦向き
    [
      [0, 1],
      [1, 1],
      [2, 1],
    ],
    [
      [0, 2],
      [1, 2],
      [2, 2],
    ],
    [
      [0, 0],
      [1, 1],
      [2, 2],
    ], // 斜め
    [
      [0, 2],
      [1, 1],
      [2, 0],
    ],
  ];

  String currentPlayer = "1";
  bool isFinished = false;
  String winner = "1";

  // Constructor to initialize message

  void updateField(String player, int row, int column) {
    if (field[row][column] != "") return;
    setState(() {
      field[row][column] = player;
      currentPlayer = currentPlayer == "1" ? "2" : "1";
    });
    checkIsGameFinished();
  }

  void checkIsGameFinished() {
    debugPrint("o");
    for (var line in lines) {
      String first = field[line[0][0]][line[0][1]];
      String second = field[line[1][0]][line[1][1]];
      String third = field[line[2][0]][line[2][1]];
      if (first != "" && first == second && first == third) {
        isFinished = true;
        winner = first;
      }
    }
    if (!isFinished) {
      bool isFilled = true;
      for (var row in field) {
        for (var cell in row) {
          if (cell == "") {
            isFilled = false;
            break;
          }
        }
        if (!isFilled) {
          break;
        }
      }
      if (isFilled) {
        isFinished = true;
        winner = "";
      }
    }
    if (isFinished) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ResultPage(winner: winner)));
    }
  }

  @override
  Widget build(BuildContext context) {
    String message = "プレイヤー$currentPlayerのターンです";
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(color: Colors.red, fontSize: 45),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.blue.shade300,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black12,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 0, 0);
                        },
                        child: Text(field[0][0])),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 0, 1);
                        },
                        child: Text(field[0][1])),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black12,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 0, 2);
                        },
                        child: Text(field[0][2])),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 1, 0);
                        },
                        child: Text(field[1][0])),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black12,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 1, 1);
                        },
                        child: Text(field[1][1])),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 1, 2);
                        },
                        child: Text(field[1][2])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black12,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 2, 0);
                        },
                        child: Text(field[2][0])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 2, 1);
                        },
                        child: Text(field[2][1])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black12,
                    child: TextButton(
                        onPressed: () {
                          updateField(currentPlayer, 2, 2);
                        },
                        child: Text(field[2][2])),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.1),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("終わり")),
          ),
        ],
      ),
    ));
  }
}
