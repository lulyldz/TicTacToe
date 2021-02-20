import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final popupText;

  PopUp(this.title, this.content, this.callback, [this.popupText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          color: Colors.amber,
          child: Text(
            popupText,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
