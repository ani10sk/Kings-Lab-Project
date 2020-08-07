import 'package:flutter/material.dart';

class Priority extends StatelessWidget {
  Map<int,dynamic> data={
    1:['Hot',Colors.red,Colors.red[200]],
    2:['Warm',Colors.blue,Colors.blue[200]],
    3:['Cold',Colors.green,Colors.green[200]],
  };
  final int priority;
  final int chosen;
  final Function func;
  Priority(
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
        child:Text(
          data[priority][0],style:TextStyle(color:priority==chosen?Colors.black:Colors.white,fontWeight:FontWeight.bold)
        )
      )
    );
  }
}