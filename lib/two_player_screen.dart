import 'dart:math';

import 'package:flutter/material.dart';
import 'package:t_game/popup.dart';
import 'package:t_game/game_button.dart';

class TwoPlayerScreen extends StatefulWidget {
  @override
  _TwoPlayerScreenState createState() => _TwoPlayerScreenState();
}

class _TwoPlayerScreenState extends State<TwoPlayerScreen> {
  List<GameButton> bLists;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bLists = doInit();
  }

  List<GameButton> doInit() {
    player1 = List();
    player2 = List();
    activePlayer = 1;

    var gButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gButtons;
  }

  void playGame(GameButton gButton) {
    setState(() {
      if (activePlayer == 1) {
        gButton.text = "X";
        gButton.background = Colors.red;
        activePlayer = 2;
        player1.add(gButton.id);
      } else {
        gButton.text = "0";
        gButton.background = Colors.black;
        activePlayer = 1;
        player2.add(gButton.id);
      }
      gButton.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (bLists.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) =>
                  PopUp("Tie!!", "Press RESET to play again.", resetGame));
        }
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) =>
                PopUp("Player1 Won", "Press RESET to play again.", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) =>
                PopUp("Player2 Won", "Press RESET to play again.", resetGame));
      }
    }

    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      bLists = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: bLists.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed:
                        bLists[i].enabled ? () => playGame(bLists[i]) : null,
                    child: Text(
                      bLists[i].text,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: bLists[i].background,
                    disabledColor: bLists[i].background,
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.amber,
              padding: const EdgeInsets.all(20.0),
              onPressed: resetGame,
            )
          ],
        ));
  }
}
