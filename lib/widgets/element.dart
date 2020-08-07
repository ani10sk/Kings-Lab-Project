import 'package:flutter/material.dart';
import '../screens/clogs.dart';
import '../screens/quicklead.dart';
import '../screens/detaillead.dart';

class Ele extends StatelessWidget{
  final double wd;
  final String image;
  final String cont;
  Ele(this.wd,this.cont,this.image);
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:(){
        if(cont=='Call Log'){
          Navigator.of(context).pushNamed(CLogs.rout);
        }else if(cont=='Quick Lead'){
          Navigator.of(context).pushNamed(QuickLead.rout);
        }else if(cont=='Detail Lead'){
          Navigator.of(context).pushNamed(DetailLead.rout);
        }
      },
      child:Container(
        width:wd*0.5,
        height:wd*0.3,
        alignment:Alignment.center,
        margin:EdgeInsets.all(5),
        decoration:BoxDecoration(
          color:Colors.white
        ),
        child: GridTile(
          child:SizedBox(height:wd*0.25,width:wd*0.25,child: Image.asset(image,fit:BoxFit.scaleDown,)),
          footer:Text(cont,style:TextStyle(fontWeight:FontWeight.bold),textAlign:TextAlign.center,),
          ),
      )
    );
  }
}