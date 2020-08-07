import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  Map<int,dynamic> data={
    1:[Icons.call,Colors.red,Colors.red[200]],
    2:[Icons.mail,Colors.blue,Colors.blue[200]],
    3:[Icons.supervised_user_circle,Colors.green,Colors.green[200]],
    4:[Icons.desktop_mac,Colors.yellow,Colors.yellow[200]]
  };
  final int priority;
  final int chosen;
  final Function func;
  Activity(
    this.priority,
    this.chosen,
    this.func
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>func(priority),
      child:Container(
        width:60,
        height:30,
        alignment:Alignment.center,
        decoration:BoxDecoration(
          color:priority==chosen?data[priority][1]:data[priority][2]
        ),
        child:Icon(
          data[priority][0],color:priority==chosen?Colors.black:Colors.white,
        )
      )
    );
  }
}