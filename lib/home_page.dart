import 'package:flutter/material.dart';
import 'package:t_game/one_player_screen.dart';
import 'package:t_game/two_player_screen.dart';

void gotoOne_Pscreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => OnePlayerScreen()),
  );
}

void gotoTwo_Pscreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => TwoPlayerScreen()),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            onPressed: () {
              gotoOne_Pscreen(context);
            },
            child: Text('One Player'),
          ),
          RaisedButton(
            onPressed: () {
              gotoTwo_Pscreen(context);
            },
            child: Text('Two Player'),
          )
        ],
      ),
    );
  }
}
