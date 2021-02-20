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
            height: 100,
          ),
          RaisedButton(
            onPressed: () {
              gotoOne_Pscreen(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(color: Colors.amber)),
            color: Colors.amber.shade50,
            textColor: Colors.amber[600],
            padding: EdgeInsets.all(40.0),
            child: Text('One Player', style: TextStyle(fontSize: 25)),
          ),
          SizedBox(
            height: 100,
          ),
          RaisedButton(
            onPressed: () {
              gotoTwo_Pscreen(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
                side: BorderSide(color: Colors.amber)),
            color: Colors.amber.shade50,
            textColor: Colors.amber[600],
            padding: EdgeInsets.all(40.0),
            child: Text('Two Player', style: TextStyle(fontSize: 25)),
          )
        ],
      ),
    );
  }
}
