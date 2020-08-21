import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/login.dart';
import './screens/menu.dart';
import './providers/auth.dart';
import './screens/clogs.dart';
import './screens/quicklead.dart';
import './screens/detaillead.dart';
import './screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:Auth(),
      child: Consumer<Auth>(
        builder:(ctx,auth,_)=>
        MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:auth.auth=='success'?
          Menu():
          FutureBuilder(
            future:auth.tryautologin(),
            builder:(ctx,snapshot)=>
            snapshot.connectionState==ConnectionState.waiting?
            Splash():
            Login()
          ),
          routes:{
            Menu.rout:(ctx)=>Menu(),
            CLogs.rout:(ctx)=>CLogs(),
            QuickLead.rout:(ctx)=>QuickLead(),
            DetailLead.rout:(ctx)=>DetailLead(),
          },
        ),
      ),
    );
  }
}
