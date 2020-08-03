import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallLogDeco extends StatelessWidget{
  final CallLogEntry log;
  CallLogDeco(this.log);
  @override
  Widget build(BuildContext context){
    String convertduration(String dur){
      double duration=double.parse(dur);
      double sec=duration%60;
      double min=sec/60;
      double hrs=min/60;
      min=min%60;
      String hour,minutes,seconds;
      hour=hrs<10?'0'+hrs.toStringAsFixed(0):hrs.toStringAsFixed(0);
      minutes=min<10?'0'+min.toStringAsFixed(0):min.toStringAsFixed(0);
      seconds=sec<10?'0'+sec.toStringAsFixed(0):sec.toStringAsFixed(0);
      return hour+':'+minutes+':'+seconds;
    }

    String convertDate(DateTime date){
      String d=DateFormat.yMMMMEEEEd().format(date);
      return d;
    }
    return Container(
      child:ListTile(
        title:Text(
          log.name==null?log.number:log.name,
        ),
        subtitle:SizedBox(
          height:80,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text(log.callType==CallType.incoming?'Incoming':
                log.callType==CallType.missed?'Missed':
                log.callType==CallType.blocked?'Blocked':
                log.callType==CallType.outgoing?'Outgoing':
                log.callType==CallType.rejected?'Rejected':
                log.callType
              ),
              Text(convertduration(log.duration.toString())),
              Text(
                (convertDate(DateTime.fromMillisecondsSinceEpoch(log.timestamp))).toString()
              ),
              Divider()
            ]
          )
        ),
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
      )
    );
  }
}