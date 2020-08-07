import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String cont;
  InputBox(this.cont);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(0,3,0,15),
      decoration:BoxDecoration(
        border:Border.all(
          color:Colors.black
        ),
        color:Colors.white
      ),
      child:TextField(
        style:TextStyle(fontSize:20),
        decoration:InputDecoration(
          hintText:cont,
          contentPadding:EdgeInsets.all(5),
          suffixIcon: Icon(Icons.keyboard_arrow_down)
        ),
        textInputAction:TextInputAction.done,
      )
    );
  }
}