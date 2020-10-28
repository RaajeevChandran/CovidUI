
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'landingpage.dart';

void main()=>runApp(MaterialApp(home:App()));





class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
 

  @override
  void initState() { 
    super.initState();
    Timer(Duration(seconds:4),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LandingPage()));
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
   
    
    return MaterialApp(
      home:SafeArea(
              child: Scaffold(
         backgroundColor: Color(0xFF1A3ACD),
         
         body:Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(top:100.0),
               child: Text('Covid-19',style:TextStyle(fontFamily: "Montserrat",fontSize:30,color: Colors.white)),
             ),
             Center(child: Image.asset('assets/images/startloading.gif',width:500,height:500,fit:BoxFit.cover),),
           ],
         )
    ),
      )
    );
  }
}
