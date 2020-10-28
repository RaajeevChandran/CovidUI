import 'package:flutter/material.dart';

import 'dart:async';

import 'Pages/landingPage.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF1A3ACD),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text('Covid-19',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 30,
                        color: Colors.white)),
              ),
              Center(
                child: Image.asset('assets/images/startloading.gif',
                    width: 300, height: 300, fit: BoxFit.cover),
              ),
            ],
          )),
    ));
  }
}
