import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/ddown.dart';

class QuickLead extends StatefulWidget{
  static const rout='quicklead';
  @override
  _QuickLeadState createState() => _QuickLeadState();
}

class _QuickLeadState extends State<QuickLead> {
  String assignedUser='SELF';
  String category='SELECT';
  String group='SELECT';
  String status='SELECT';
  int expAssignedUser=0;
  int expCategory=0;
  int expGroup=0;
  int expStatus=0;
  @override
  void initState(){
    getper();
    super.initState();
  }

  void changeuser(String user){
    setState(() {
      assignedUser=user;
      expAssignedUser=0;
    });
  }

  void expuser(){
    setState(() {
      expAssignedUser==0?expAssignedUser=1:expAssignedUser=0;
    });
  }

  void changegroup(String groups){
    setState(() {
      group=groups;
      expGroup=0;
    });
  }

  void expagroup(){
    setState(() {
      expGroup==0?expGroup=1:expGroup=0;
    });
  }

  void changeCat(String cat){
    setState(() {
      category=cat;
      expCategory=0;
    });
  }

  void expCat(){
    setState(() {
      expCategory==0?expCategory=1:expCategory=0;
    });
  }

  void expStatu(){
    setState(() {
      expStatus==0?expStatus=1:expStatus=0;
    });
  }

  void changeStat(String stat){
    setState(() {
      status=stat;
      expStatus=0;
    });
  }

  var isrecording=false;

  AudioPlayer audioPlayer=AudioPlayer();
  Recording rec;

  Future<void> getper()async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.speech,
      Permission.storage,
    ].request();
  }

  Future<void>startrecord()async{
    bool haspermission=await AudioRecorder.hasPermissions;
    print(haspermission);
    await AudioRecorder.start();
  }

  play()async{
    int res=await audioPlayer.play(rec.path,isLocal:true);
    print(res);
  }

  Future<void> stoprecord()async{
    print('hello');
    rec=await AudioRecorder.stop();
    print('Path:${rec.path} ,format:${rec.audioOutputFormat} ,durayion:${rec.duration} ,extension:${rec.extension}');
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
            Box(20,20,20,10,'','Search',Colors.red,Icons.search),
            Table(
              children:[
                TableRow(
                  children:[
                    Box(20,10,10,10,'Phone Number','Mobile Number',Colors.red,Icons.phone),
                    Box(10,10,20,10,'Contact Name','Contact Name',Colors.black,Icons.add_call)
                  ]
                ),
                TableRow(
                  children:[
                    Box(20,10,10,10,'13-7-2020','Followup date',Colors.red,Icons.calendar_today),
                    Box(10,10,20,10,'09:00 AM','Followup Time',Colors.red,Icons.access_time)
                  ]
                ),
                TableRow(
                  children:[
                    Box(20,10,10,10,'13-7-2020','Closure date',Colors.red,Icons.calendar_today),
                    Box(10,10,20,10,'09:00 AM','Closure Time',Colors.red,Icons.access_time)
                  ]
                ),
                TableRow(
                  children:[
                    Selected('Assigned User', wd,['Sample 1','Sample 2'],assignedUser,expAssignedUser,changeuser,expuser),
                    Selected('Group', wd,['Sample 1','Sample 2'],group,expGroup,changegroup,expagroup),
                  ]
                ),
                TableRow(
                  children:[
                    Selected('Category', wd,['Sample 1','Sample 2'],category,expCategory,changeCat,expCat),
                    Selected('Status', wd,['Sample 1','Sample 2'],status,expStatus,changeStat,expStatu),
                  ]
                )
              ]
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
                  contentPadding:EdgeInsets.fromLTRB(10,0,0,0),
                  suffixIcon:IconButton(
                    icon:Icon(isrecording?Icons.mic:Icons.mic_none,color:Colors.blue), 
                    onPressed:(){
                      if(isrecording){
                        stoprecord();
                        setState(() {
                          isrecording=false;
                        });
                      }else{
                        startrecord();
                        setState(() {
                          isrecording=true;
                        });
                      }
                    }
                  ),
                  prefixIcon:IconButton(icon:Icon(Icons.play_arrow), onPressed:play)
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
  final String label;
  final IconData d;

  Box(
    this.l,
    this.t,
    this.r,
    this.b,
    this.hint,
    this.label,
    this.bcolor,
    this.d
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(l,t,r,b),
      /*decoration:BoxDecoration(
      ),*/
      child:TextField(
        style:TextStyle(fontSize:20),
        decoration:InputDecoration(
          labelText:label,
          hintText:hint,
          labelStyle:TextStyle(fontSize:12),
          hintStyle:TextStyle(fontSize:12),
          contentPadding:EdgeInsets.all(3),
          suffixIcon:Icon(d,color:Colors.blue,)
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
