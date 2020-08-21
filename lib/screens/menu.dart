import 'package:flutter/material.dart';
import '../widgets/element.dart';
import '../widgets/drawer.dart';

class Menu extends StatefulWidget{
  static const rout='menu';
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var onChange=false;
  final List<String> cont=[
    'Call Log','Quick Lead','Detail Lead','Summary','Activities','All Leads','Upcoming','Pending','Expected','Notification'
  ];
  @override
  Widget build(BuildContext context){
    //final ht=MediaQuery.of(context).size.height;
    final wd=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.grey[300],
      appBar:AppBar(
        backgroundColor:Colors.black87,
        title:Text(
          'Sales Logics',style:TextStyle(
            color:Colors.white
          ),
        ),
        actions: <Widget>[
          Switch(
            inactiveTrackColor:Colors.white70,
            activeTrackColor:Colors.white70,
            activeColor:Colors.white,
            value:onChange, 
            onChanged:(newVal){
              setState(() {
                onChange=newVal;
              });
            }
          ),
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
      drawer:AppDrawer(),
      body:SingleChildScrollView(
        child:Column(
          children:[
            Container(
              alignment:Alignment.center,
              width:wd,
              decoration:BoxDecoration(
                color:onChange?Colors.green:Colors.red
              ),
              child:Text(onChange?'on Duty':
                'Off Duty',style:TextStyle(
                  fontSize:15,color:Colors.white,fontStyle:FontStyle.italic
                ),
              ),
            ),
            Table(
              children:[
                TableRow(
                  children:[
                    Option('DUTY',wd),
                    Option('START',wd),
                    Option('REACH',wd),
                    Option('STOP',wd),
                  ]
                )
              ]
            ),
            Table(
              children:[
                TableRow(
                  children:[
                    Ele(wd,cont[0],'assets/call.png'),
                    Ele(wd,cont[1],'assets/bolt.png')
                  ]
                ),
                TableRow(
                  children:[
                    Ele(wd,cont[2],'assets/monitor.png'),
                    Ele(wd,cont[3],'assets/graphs.png')
                  ]
                ),
                TableRow(
                  children:[
                    Ele(wd,cont[4],'assets/pad.png'),
                    Ele(wd,cont[5],'assets/users.png')
                  ]
                ),
                TableRow(
                  children:[
                    Ele(wd,cont[6],'assets/download.png'),
                    Ele(wd,cont[7],'assets/clock.png')
                  ]
                ),
                TableRow(
                  children:[
                    Ele(wd,cont[8],'assets/like.png'),
                    Ele(wd,cont[9],'assets/bell.png')
                  ]
                ),
              ]
            )
          ] 
        )
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String cont;
  final double wd;
  Option(
    this.cont,
    this.wd
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      margin:EdgeInsets.all(5),
      width:wd*0.2,
      height:wd*0.12,
      padding:EdgeInsets.all(5),
      decoration:BoxDecoration(
        color:Colors.white
      ),
      child:Text(
        cont,style:TextStyle(
          color:Colors.indigo,fontWeight:FontWeight.bold
        ),
      )
    );
  }
}