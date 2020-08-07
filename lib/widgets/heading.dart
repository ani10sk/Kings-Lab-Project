import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String cont;
  final int star;
  final int newt;

  Heading(
    this.cont,
    this.star,
    this.newt
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.fromLTRB(0,8,0,5),
      child:SizedBox(
        child:Row(
          children:[
            Text(
              cont
            ),
            Text(
              star==1?'*':'',style:TextStyle(color:Colors.red)
            ),
            Expanded(child:SizedBox()),
            Text(
              newt==1?'+New':'',style:TextStyle(color:Colors.blue),
            )
          ]
        )
      )
    );
  }
}