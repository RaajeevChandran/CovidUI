import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  createState() => new MyAppState();
}

const EdgeInsets pad20 = const EdgeInsets.all(20.0);
const String spKey = 'myBool';

class MyAppState extends State<MyApp> {
  SharedPreferences sharedPreferences;

  bool _testValue;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      _testValue = sharedPreferences.getBool(spKey);
      // will be null if never previously saved
      if (_testValue == null) {
        _testValue = false;
        persist(_testValue); // set an initial value
      }
      setState(() {});
    });
  }

  void persist(bool value) {
    setState(() {
      _testValue = value;
    });
    sharedPreferences?.setBool(spKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(
                padding: pad20,
                child:  Text(
                    _testValue == null ? 'not ready' : _testValue.toString()),
              ),
               Padding(
                padding: pad20,
                child:  RaisedButton(
                  child:  Text('Save True'),
                  onPressed: () => persist(true),
                ),
              ),
               Padding(
                padding: pad20,
                child:  RaisedButton(
                  child:  Text('Save False'),
                  onPressed: () => persist(false),
                ),
              ),
               Padding(
                padding: pad20,
                child:  RaisedButton(
                  child:  Text('Print myBool'),
                  onPressed: () => print(_testValue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}