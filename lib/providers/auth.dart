import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      //print(auth);
      notifyListeners();
      if(auth=='success'){
        final prefs=await SharedPreferences.getInstance();
        final data=json.encode({
        'auth':auth
      });
      prefs.setString('data',data);
      }
      
      //print('hi');
    }catch(error){
      print('error');
      //print(response.body['auth']);
    }
  }

  Future<void> tryautologin()async{
    final prefs=await SharedPreferences.getInstance();
    if(!prefs.containsKey('data')){
      print('hello');
      auth=null;
    }
    final extracteddata=json.decode(prefs.getString('data')) as Map<String,Object>;
    auth=extracteddata['auth'];
    notifyListeners();
    print('auth');
  }

  Future<void> logOut()async{
    auth=null;
    notifyListeners();
    final prefs=await SharedPreferences.getInstance();
    prefs.clear();
  }
}