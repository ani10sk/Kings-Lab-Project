import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isWaiting=false;
  TextEditingController email=TextEditingController();

  TextEditingController psw=TextEditingController();

  @override
  Widget build(BuildContext context){
    final ht=MediaQuery.of(context).size.height;
    final wd=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.grey[300],
      appBar:AppBar(
        title:Text('Sales Logics'),
        backgroundColor:Colors.black87,
      ),
      body:isWaiting?Center(child:CircularProgressIndicator()):ListView(
        children:[
          SizedBox(
            height:ht*0.15
          ),
          Container(
            child:Image.asset('assets/logo1.jpg')
          ),
          SizedBox(
            height:ht*0.009
          ),
          Detail(wd: wd, ht: ht,cont:'Email',type:TextInputType.emailAddress,ans:email,),
          Detail(wd: wd, ht: ht,cont:'Password',type:TextInputType.visiblePassword,ans:psw,),
          InkWell(
            onTap:()async{
              //print('jello');
              setState(() {
                isWaiting=true;
              });
              await Provider.of<Auth>(context,listen:false).getLogin(email.text.toString(),psw.text.toString());
              setState(() {
                isWaiting=false;
              });
              if(Provider.of<Auth>(context,listen:false).auth=='failed'){
                showDialog(
                  context:context,
                  builder:(context)=>AlertDialog(
                    title:Text('Error'),
                    content:Text('Make sure you entered correct username and password'),
                    actions: <Widget>[FlatButton(onPressed:()=>Navigator.of(context).pop(), child:Text('OK'))],
                  )
                );
              }
            },
            child: Container(
              alignment:Alignment.centerRight,
              margin:EdgeInsets.fromLTRB(wd*0.08,wd*0.02,wd*0.08,0),
              padding:EdgeInsets.all(wd*0.01),
              width:wd*0.9,
              height:ht*0.07,
              child:Container(
                alignment: Alignment.center,
                height:ht*0.07,
                width:wd*0.3,
                decoration:BoxDecoration(
                  color:Colors.indigo,
                ),
                child:Text(
                  'LOGIN',style:TextStyle(
                    fontSize:ht*0.025,
                    color:Colors.white,
                    fontWeight:FontWeight.bold
                  ),
                ),
              )
            ),
          )
        ]
      )
    );
  }
}

class Detail extends StatelessWidget {

  final double wd;
  final double ht;
  final String cont;
  final TextInputType type;
  final TextEditingController ans;

  Detail({
    this.wd,
    this.ht,
    this.cont,
    this.type,
    this.ans
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(wd*0.08,wd*0.06,wd*0.08,0),
      padding:EdgeInsets.all(wd*0.01),
      width:wd*0.9,
      height:ht*0.07,
      decoration:BoxDecoration(
        color:Colors.white,
        border:Border.all()
      ),
      child:TextField(
        controller:ans,
        textInputAction:cont=='Email'?TextInputAction.next:TextInputAction.done,
        obscureText:type==TextInputType.visiblePassword?true:false,
        keyboardType:type,
        decoration:InputDecoration(
          border:InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText:cont,
          hintStyle:TextStyle(fontSize:ht*0.025),
        ),
        style:TextStyle(fontSize:ht*0.025),
      ),
    );
  }
}