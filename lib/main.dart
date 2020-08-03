import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/login.dart';
import './screens/menu.dart';
import './providers/auth.dart';
import './screens/clogs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:Consumer<Auth>(
          builder:(ctx,auth,_)=>auth.auth==null?
          Login():auth.auth=='success'?Menu():Login(),
        ),
        routes:{
          Menu.rout:(ctx)=>Menu(),
          CLogs.rout:(ctx)=>CLogs()
        },
      ),
    );
  }
}
