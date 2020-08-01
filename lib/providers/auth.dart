import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth extends ChangeNotifier{
  String auth;
  Future<void> getLogin(String usr,String psw)async{
    //print('hello');
    final url='https://mdm.saleslogics.in/api/UserAuth/$usr/$psw';
    try{
      //print('hello');
      final response=await http.get(url);
      final extract=json.decode(response.body) as Map<String,dynamic>;
      auth=extract['auth'];
      notifyListeners();
      //print('hi');
    }catch(error){
      print('error');
      //print(response.body['auth']);
    }
  }
}