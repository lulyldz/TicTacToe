import 'package:flutter/material.dart';
import 'package:t_game/home_page.dart';


void main() => runApp( TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber,visualDensity: VisualDensity.adaptivePlatformDensity, backgroundColor: Colors.amber[300]),
      home: HomePage(),
    );
  }
}