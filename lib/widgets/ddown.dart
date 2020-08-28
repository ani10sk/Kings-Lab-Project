import 'package:flutter/material.dart';

class Selected extends StatelessWidget{
  final String head;
  final double wd;
  final List<String> options;
  final String first;
  final int isexpanded;
  final Function change;
  final Function drop;
  Selected(
    this.head,
    this.wd,
    this.options,
    this.first,
    this.isexpanded,
    this.change,
    this.drop
  );
  @override
  Widget build(BuildContext context){
    return AnimatedContainer(
      height:isexpanded==0?50:168,
      margin:EdgeInsets.fromLTRB(20,5,20,15),
      duration:Duration(seconds:1),
      child:SizedBox(
        height:isexpanded==0?78:160,
        child:ListView(
          physics:NeverScrollableScrollPhysics(),
          children:[
            Text(
              head,style:TextStyle(
                fontSize:15,color:Colors.grey
              )
            ),
            Container(
              child:SizedBox(
                width:wd*0.4,
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    Text(first,style:TextStyle(
                      fontSize:15,fontWeight:FontWeight.bold
                    ),),
                    IconButton(
                      onPressed:drop,
                      icon:Icon(isexpanded==0?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,color:Colors.blue,),
                    )
                  ]
                )
              )
            ),
            isexpanded==0?
            Divider(
              color:Colors.black,
              thickness:1,
            ):
            SizedBox(
              height:115,
              child:Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children:[
                  ListTile(
                    onTap:()=>change(options[0]),
                    title:Text(
                      options[0],style:TextStyle(
                        fontSize:15
                      )
                    )
                  ),
                  ListTile(
                    onTap:()=>change(options[1]),
                    title:Text(
                      options[1],style:TextStyle(
                        fontSize:15
                      )
                    )
                  ),
                ]
              ),
            )
          ]
        )
      ),
    );
  }
  }