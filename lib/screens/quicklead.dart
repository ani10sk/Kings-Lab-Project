import 'package:flutter/material.dart';

class QuickLead extends StatefulWidget{
  static const rout='quicklead';
  @override
  _QuickLeadState createState() => _QuickLeadState();
}

class _QuickLeadState extends State<QuickLead> {
  String assignedUser='SELF';
  String category='SELECT';
  String group='SELECT';
  int expAssignedUser=0;
  int expCategory=0;
  int expGroup=0;

  @override
  Widget build(BuildContext context){
    final wd=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.grey[100],
      appBar:AppBar(
        backgroundColor:Colors.black87,
        title:Text('Sales Logics'),
        actions: <Widget>[
          FlatButton(
            onPressed: null, 
            child:Text('SAVE',style:TextStyle(color:Colors.white),)
            )
        ],
      ),
      body:SingleChildScrollView(
        child:Column(
          children:[
            Cont(wd,'Quick Lead',Colors.grey,30,FontWeight.bold,FontStyle.normal),
            Cont(wd,'All mandatory fields are given in red',Colors.red,18,FontWeight.normal,FontStyle.italic),
            SizedBox(height:40,child:Container(
              width:wd,margin:EdgeInsets.all(20),
              alignment:Alignment.centerRight,
              child:Icon(Icons.location_off,color:Colors.red,),)),
            Box(20,20,20,10,'',Colors.red,1),
            Table(
              children:[
                TableRow(
                  children:[
                    Box(20,10,10,10,'Phone Number',Colors.red,0),
                    Box(10,10,20,10,'Location',Colors.black,0)
                  ]
                ),
                TableRow(
                  children:[
                    Box(20,10,10,10,'Follow up Date',Colors.red,0),
                    Box(10,10,20,10,'09:00 AM',Colors.red,0)
                  ]
                )
              ]
            ),
            AnimatedContainer(
              //color:Colors.red,
              height:expAssignedUser==0?40:140,
              margin:EdgeInsets.fromLTRB(20,20,20,20),
              duration:Duration(seconds:1),
              child:SizedBox(
                height:expAssignedUser==0?40:140,
                width:wd-40,
                child:ListView(
                  children:[
                    Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      Text('   Assigned User:  ',style:TextStyle(fontSize:17),),
                      Text(assignedUser,style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)),
                      Expanded(child:SizedBox()),
                      IconButton(
                        icon:Icon(expAssignedUser==0?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up), 
                        onPressed:(){
                          setState(() {
                            if(expAssignedUser==0){
                              expAssignedUser=1;
                            }else{
                              expAssignedUser=0;
                            }
                          });
                        }
                        )
                    ],
                  ),
                  expAssignedUser==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    alignment:Alignment.center,
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          assignedUser='SELF';
                          expAssignedUser=0;
                        });
                      }, 
                      child:Text('SELF',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  expAssignedUser==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          assignedUser='SAMPLE';
                          expAssignedUser=0;
                        });
                      }, 
                      child:Text('SAMPLE',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  ] 
                ),
              )
            ),
            AnimatedContainer(
              //color:Colors.red,
              height:expCategory==0?40:140,
              margin:EdgeInsets.fromLTRB(20,20,20,20),
              duration:Duration(seconds:1),
              child:SizedBox(
                height:expCategory==0?40:140,
                width:wd-40,
                child:ListView(
                  children:[
                    Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      Text('            Category:  ',style:TextStyle(fontSize:17),),
                      Text(category,style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)),
                      Expanded(child:SizedBox()),
                      IconButton(
                        icon:Icon(expCategory==0?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up), 
                        onPressed:(){
                          setState(() {
                            if(expCategory==0){
                              expCategory=1;
                            }else{
                              expCategory=0;
                            }
                          });
                        }
                        )
                    ],
                  ),
                  expCategory==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    alignment:Alignment.center,
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          category='SAMPLE 1';
                          expCategory=0;
                        });
                      }, 
                      child:Text('SAMPLE 1',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  expCategory==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          category='SAMPLE 2';
                          expCategory=0;
                        });
                      }, 
                      child:Text('SAMPLE 2',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  ] 
                ),
              )
            ),
            AnimatedContainer(
              //color:Colors.red,
              height:expGroup==0?40:140,
              margin:EdgeInsets.fromLTRB(20,20,20,20),
              duration:Duration(seconds:1),
              child:SizedBox(
                height:expGroup==0?40:140,
                width:wd-40,
                child:ListView(
                  children:[
                    Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      Text('                 Group:  ',style:TextStyle(fontSize:17),),
                      Text(group,style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)),
                      Expanded(child:SizedBox()),
                      IconButton(
                        icon:Icon(expGroup==0?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up), 
                        onPressed:(){
                          setState(() {
                            if(expGroup==0){
                              expGroup=1;
                            }else{
                              expGroup=0;
                            }
                          });
                        }
                        )
                    ],
                  ),
                  expGroup==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    alignment:Alignment.center,
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          group='SAMPLE 1';
                          expGroup=0;
                        });
                      }, 
                      child:Text('SAMPLE 1',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  expGroup==1?
                  Container(
                    decoration:BoxDecoration(
                      border:Border.all(
                        color:Colors.black
                      )
                    ),
                    width:wd-40,
                    child:FlatButton(
                      onPressed:(){
                        setState(() {
                          group='SAMPLE 2';
                          expGroup=0;
                        });
                      }, 
                      child:Text('SAMPLE 2',style:TextStyle(fontWeight:FontWeight.bold,fontSize:17)))
                  ):SizedBox(),
                  ] 
                ),
              )
            ),
            Container(
              width:wd-40,
              margin:EdgeInsets.fromLTRB(20,10,20,10),
              decoration:BoxDecoration(
                border:Border.all(
                  color:Colors.black
                )
              ),
              child:TextField(
                maxLines:2,
                decoration:InputDecoration(
                  hintText:'Comment',
                  contentPadding:EdgeInsets.fromLTRB(10,0,0,0)
                ),
                textInputAction:TextInputAction.done,
              )
            )
          ]
        )
      ),
    );
  }
}

class Box extends StatelessWidget {
  final double l;
  final double t;
  final double r;
  final double b;
  final String hint;
  final Color bcolor;
  final int isicon;

  Box(
    this.l,
    this.t,
    this.r,
    this.b,
    this.hint,
    this.bcolor,
    this.isicon
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(l,t,r,b),
      decoration:BoxDecoration(
        border:Border.all(
          color:bcolor
        )
      ),
      child:TextField(
        style:TextStyle(fontSize:20),
        decoration:InputDecoration(
          hintText:hint,
          hintStyle:TextStyle(fontSize:15),
          contentPadding:EdgeInsets.all(10),
          suffixIcon:isicon==1?Icon(Icons.search,color:Colors.black,):null
        ),
      )
    );
  }
}

class Cont extends StatelessWidget {

  final double wd;
  final String cont;
  final double size;
  final Color col;
  final FontWeight wt;
  final FontStyle stl;

  Cont(
    this.wd,
    this.cont,
    this.col,
    this.size,
    this.wt,
    this.stl
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(20,20,20,0),
      width:wd,
      alignment:Alignment.center,
      child:Text(
        cont,style:TextStyle(
          color:col,fontSize:size,fontWeight:wt,fontStyle:stl
        )
      ),
    );
  }
}