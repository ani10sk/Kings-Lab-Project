import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child:ListView(
        children:[
          AppBar(
            title:Text('Options'),
            backgroundColor:Colors.black87
          ),
          ListTile(
            onTap:()=>Provider.of<Auth>(context,listen:false).logOut(),
            title:Text('Sign Out',style:TextStyle(fontSize:18),),
            leading:Icon(Icons.settings_power,size:18,color:Colors.black,)
          ),
          Divider()
        ]
      ),
    );
  }
}