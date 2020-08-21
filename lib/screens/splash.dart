import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child://Image.asset('assets/logo1.jpg')
        Text('Hello',style:TextStyle(fontSize:40,fontWeight:FontWeight.bold))
      )
    );
  }
}