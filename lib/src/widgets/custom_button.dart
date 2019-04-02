import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  String _title;
  VoidCallback onPressed;

  CustomButton({String title, VoidCallback onPressed}){
    this._title = title;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        height: 44.0,
        child : RaisedButton(
          child: Text(_title),
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13)
          ),
        )
    );
  }

}