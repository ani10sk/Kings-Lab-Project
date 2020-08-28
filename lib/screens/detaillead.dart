import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/input_box.dart';
import '../widgets/priority.dart';
import '../widgets/activities.dart';

class DetailLead extends StatefulWidget{
  static const rout='detaillead';
  @override
  _DetailLeadState createState() => _DetailLeadState();
}

class _DetailLeadState extends State<DetailLead> {
  int typeOfuser=0;
  void changeUser(){
    if(typeOfuser==0){
      setState(() {
        typeOfuser=1;
      });
    }else{
      setState(() {
        typeOfuser=0;
      });
    }
  }
  int chosenpriority=3;
  void changepriority(int value){
    setState(() {
      chosenpriority=value;
    });
  }
  int chosenactivity=1;
  void changeactivity(int value){
    setState(() {
      chosenactivity=value;
    });
  }
  @override
  Widget build(BuildContext context){
    final wd=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.grey[100],
      appBar:AppBar(
        backgroundColor:Colors.black87,
        title:Text('Sales Logics'),
        actions: <Widget>[
          PopupMenuButton(
            icon:Icon(Icons.more_vert),
            itemBuilder:(_)=>[
              PopupMenuItem(
                child:Text('Sample 1'),
                value:1,
                ),
              PopupMenuItem(
                child:Text('Sample 2'),
                value:2,
                )
            ],
          )
        ],
      ),
      body:SingleChildScrollView(
        child:Padding(
          padding:EdgeInsets.fromLTRB(15,20,15,20),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:EdgeInsets.fromLTRB(0,10,0,20),
                child:Text(
                  'Add New Lead',style:TextStyle(
                    fontSize:18,fontWeight:FontWeight.bold
                  ),
                )
              ),
              SizedBox(
                width:wd-40,
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    AddNew(1,'Corporate',Icons.account_balance,Colors.orange,changeUser,(wd-40)/2,typeOfuser),
                    AddNew(0,'Individual',Icons.account_circle,Colors.black,changeUser,(wd-40)/2,typeOfuser),
                  ]
                )
              ),
              Divider(
                thickness:2,
              ),
              Heading('Company',1,1),
              InputBox(''),
              Heading('Contact',1,1),
              InputBox(''),
              Heading('Priority',0,0),
              SizedBox(
                width:wd-40,
                child:Row(
                  children:[
                    Priority(1,chosenpriority,changepriority),
                    Priority(2,chosenpriority,changepriority),
                    Priority(3,chosenpriority,changepriority)
                  ]
                )
              ),
              SizedBox(height:18),
              Heading('Assigned User',0,0),
              InputBox('Kings Lab-(Administrattor)'),
              Heading('Activity Type',0,0),
              SizedBox(
                width:wd-40,
                child:Row(
                  children:[
                    Activity(1,chosenactivity,changeactivity),
                    Activity(2,chosenactivity,changeactivity),
                    Activity(3,chosenactivity,changeactivity),
                    Activity(4,chosenactivity,changeactivity)
                  ]
                )
              ),
              SizedBox(height:18),
              Heading('Source',1,1),
              InputBox(''),
              Heading('Status',1,0),
              InputBox(''),
              Heading('Activity',1,0),
              InputBox(''),
              Heading('Follow Up',1,0),
              InputBox('Date'),
              Heading('Time',0,0),
              InputBox('09:00 AM'),
              Heading('Exp Closure',0,0),
              InputBox('Date'),
              Divider(
                thickness:2
              ),
              Container(
                width:wd,
                alignment:Alignment.centerLeft,
                child: Text(
                  '[ 1 ]',style:TextStyle(
                    color:Colors.grey,fontSize:35,fontWeight:FontWeight.bold
                  )
                ),
              ),
              Heading('Category',1,0),
              InputBox(''),
              Heading('Product Group',1,1),
              InputBox(''),
              Heading('Product Title',1,0),
              InputBox('Product Title'),
              Heading('Quantity',0,0),
              InputBox('0'),
              Heading('Unit Price',0,0),
              InputBox('0'),
              Heading('Sale Value',0,0),
              InputBox('0'),
              Heading('Tax %',1,1),
              InputBox(''),
              Heading('Tax Value',0,0),
              InputBox('0'),
              Heading('Gross Total',0,0),
              InputBox('0'),
              SizedBox(height:18),
              Container(
                height:60,
                width:60,
                color:Colors.blue,
                child:Icon(
                  Icons.add,color:Colors.white
                )
              ),
              SizedBox(height:15),
              Text('Comments',style:TextStyle(fontSize:15)),
              SizedBox(height:8),
              Container(
                width:wd-40,
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
            ],
          ),
        )
      ),
    );
  }
}

class AddNew extends StatelessWidget{
  final int value;
  final String cont;
  final IconData icon;
  final Color color;
  final Function funct;
  final double wd;
  final int typeOfUser;
  AddNew(
    this.value,
    this.cont,
    this.icon,
    this.color,
    this.funct,
    this.wd,
    this.typeOfUser
  );
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width:wd,
      child:Row(
        children:[
          IconButton(
            icon:Icon(typeOfUser==value?Icons.check_circle:Icons.check_circle_outline,color:Colors.blue), 
            onPressed:funct
          ),
          icon==null?SizedBox():
          Icon(icon,color:color),
          Container(
            margin:EdgeInsets.fromLTRB(10,0,0,0),
            child:Text(
              cont,style:TextStyle(
                fontSize:15,fontWeight:FontWeight.bold
              )
            )
          ),
        ]
      ),
    );
  }
}