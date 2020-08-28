import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/ddown.dart';
import '../widgets/date.dart';

class QuickLead extends StatefulWidget{
  static const rout='quicklead';
  @override
  _QuickLeadState createState() => _QuickLeadState();
}

class _QuickLeadState extends State<QuickLead> {
  //Variables
  String assignedUser='SELF';
  String category='SELECT';
  String group='SELECT';
  String status='SELECT';
  String budget='SELECTED';
  String payment='SELECTED';
  String branch='SELECTED';
  String region='SELECTED';
  int expbranch=0;
  int expregion=0;
  int expquicklead=0;
  int exppayment=0;
  int expbudget=0;
  int expAssignedUser=0;
  int expCategory=0;
  int expGroup=0;
  int expStatus=0;
  int typeofuser=0;
  void changeusercir(val){
    setState(() {
      typeofuser=val;
    });
  }
  @override
  void initState(){
    getper();
    super.initState();
  }
  //Functions
  void changeuser(String user){
    setState(() {
      assignedUser=user;
      expAssignedUser=0;
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

  void expuser(){
    setState(() {
      expAssignedUser==0?expAssignedUser=1:expAssignedUser=0;
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

  void changeBudg(String stat){
    setState(() {
      budget=stat;
      expbudget=0;
    });
  }

  void expbudg(){
    setState(() {
      expbudget==0?expbudget=1:expbudget=0;
    });
  }

  void changePayment(String stat){
    setState(() {
      payment=stat;
      exppayment=0;
    });
  }

  void exppay(){
    setState(() {
      exppayment==0?exppayment=1:exppayment=0;
    });
  }

  void changebranch(String stat){
    setState(() {
      branch=stat;
      expbranch=0;
    });
  }

  void expbr(){
    setState(() {
      expbranch==0?expbranch=1:expbranch=0;
    });
  }

  void changereg(String stat){
    setState(() {
      region=stat;
      expregion=0;
    });
  }

  void expr(){
    setState(() {
      expregion==0?expregion=1:expregion=0;
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
            Box(20,20,20,10,'','Search Existing Client',Colors.red,Icons.search,Colors.black),
            Table(
              children:[
                TableRow(
                  children:[
                    Box(20,10,10,10,'Phone Number','Mobile Number',Colors.red,Icons.phone,Colors.red),
                    Box(10,10,20,10,'Contact Name','Contact Name',Colors.black,Icons.add_call,Colors.red),
                  ]
                ),
                TableRow(
                  children:[
                    DatePick('Followup Date'),
                    DatePick('Closure Date'),
                  ]
                ),
              ],
            ),
            Table(
              children:[
                TableRow(
                  children:[
                    AddNewData(0,'Hot',null,Colors.orange,changeusercir,(wd-40)/2,typeofuser),
                    AddNewData(1,'Warm',null,Colors.black,changeusercir,(wd-40)/2,typeofuser),
                    AddNewData(2,'Cold',null,Colors.black,changeusercir,(wd-40)/2,typeofuser),
                  ]
                ),
              ]
            ),
            Table(
              children:[
               TableRow(
                  children:[
                    Selected('Category', wd,['Sample 1','Sample 2'],category,expCategory,changeCat,expCat),
                    Selected('Group', wd,['Sample 1','Sample 2'],group,expGroup,changegroup,expagroup),
                  ]
                ), 
              ]
            ),
            Box(20,20,20,10,'','Product Search',Colors.red,Icons.search,Colors.red),
            Table(
              children:[
               TableRow(
                  children:[
                    Selected('Budget', wd,['Sample 1','Sample 2'],budget,expbudget,changeBudg,expbudg),
                    Selected('Payment', wd,['Sample 1','Sample 2'],payment,exppayment,changePayment,exppay),
                  ]
                ), 
              ]
            ),
            expquicklead==0?
            FlatButton(
              onPressed:(){
                setState(() {
                  expquicklead=1;
                });
              }, 
              child:Text(
                'Add More Details',style:TextStyle(
                  fontWeight:FontWeight.bold,decoration:TextDecoration.underline
                )
              )
            ):SizedBox(),
            expquicklead==1?
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
            ):SizedBox(),
            expquicklead==0?SizedBox():
            Table(
              children:[
                TableRow(
                  children:[
                    Selected('Assigned User', wd,['Sample 1','Sample 2'],assignedUser,expAssignedUser,changeuser,expuser),
                    Box(20,10,10,10,'Enter email id','Email id',Colors.red,Icons.mail,Colors.black),
                  ]
                ),
                TableRow(
                  children:[
                    Selected('Branch', wd,['Sample 1','Sample 2'],branch,expbranch,changebranch,expbr),
                    Selected('Region', wd,['Sample 1','Sample 2'],region,expregion,changereg,expr),
                  ]
                ),
              ],
            ),
            expquicklead==1?
            FlatButton(
              onPressed:(){
                setState(() {
                  expquicklead=0;
                });
              }, 
              child:Text(
                'Show Less',style:TextStyle(
                  fontWeight:FontWeight.bold,decoration:TextDecoration.underline
                )
              )
            ):SizedBox(),
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
  final Color underline;

  Box(
    this.l,
    this.t,
    this.r,
    this.b,
    this.hint,
    this.label,
    this.bcolor,
    this.d,
    this.underline
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
          enabledBorder: UnderlineInputBorder(      
            borderSide: BorderSide(color:underline),   
          ),  
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

class Cont extends StatelessWidget{

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

class AddNewData extends StatelessWidget{
  final int value;
  final String cont;
  final IconData icon;
  final Color color;
  final Function funct;
  final double wd;
  final int typeOfUser;
  AddNewData(
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
      child:Container(
        margin:EdgeInsets.fromLTRB(wd/20,0,wd/20,0),
        child: Row(
          children:[
            IconButton(
              icon:Icon(typeOfUser==value?Icons.check_circle:Icons.check_circle_outline,color:Colors.blue), 
              onPressed:()=>funct(value)
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
      ),
    );
  }
}