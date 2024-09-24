// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'start.dart';

class ResultPage extends StatelessWidget {
  final String winner;
  const ResultPage({Key? key, required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              winner == "" ? "引き分け" : "$winnerの勝ち!!",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => StartPage()));
                },
                child: Text("もう一度遊ぶ"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
