import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:call_log/call_log.dart';
import '../widgets/call_log.dart';

class CLogs extends StatefulWidget{
  static const rout='clogs';
  @override
  _CLogsState createState() => _CLogsState();
}

class _CLogsState extends State<CLogs> {
  var iswaiting=false;
  List<CallLogEntry> logs=[];
  @override
  void initState(){
    requestper().then((_) =>getCallLog());
    super.initState();
  }

  Future<void> requestper()async{
     Map<Permission,PermissionStatus> statuses=await [
      Permission.contacts,
    ].request();
  }

  getCallLog()async{
    setState(() {
      iswaiting=true;
    });
    List<CallLogEntry> entries=(await CallLog.get()).toList();
    logs=entries;
    setState(() {
      iswaiting=false;
    });
    print(logs.length);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.grey[300],
      appBar:AppBar(
        backgroundColor:Colors.black87,
        title:Text('Sales Logics')
      ),
      body:iswaiting?Center(child:CircularProgressIndicator(),):
      ListView.builder(
        itemBuilder:(ctx,i)=>CallLogDeco(logs[i])
        /*ListTile(
          title:Text(logs[i].name==null?logs[i].number:logs[i].name),
          subtitle:Text(logs[i].callType==CallType.incoming?'Incoming':
          logs[i].callType==CallType.missed?'Missed':
          logs[i].callType==CallType.blocked?'Blocked':
          logs[i].callType==CallType.outgoing?'Outgoing':
          logs[i].callType==CallType.rejected?'Rejected':
          logs[i].callType),
          trailing:Container(
            height:30,
            width:70,
            alignment:Alignment.center,
            decoration:BoxDecoration(
              color:Colors.blueGrey
            ),
            child:Text(
              '+LEAD',style:TextStyle(color:Colors.white,fontSize:15)
            )
          ),
          leading:Text(logs[i].duration.toString()),
        )*/,
        itemCount:logs.length,
        ),
    );
  }
}