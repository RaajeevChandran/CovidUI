import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true"), //https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search
      headers: {
        "Accept": "application/json"
      }

    );
      debugPrint(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["country"]);
    
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data == null ? 0: data.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap:(){
                
            },
            child:Card(
            
            color: Colors.blueGrey,
            child: Container(
              padding:EdgeInsets.all(20.0),
              margin:EdgeInsets.all(20.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data[index]["country"]+':',style:TextStyle(fontSize: 20.0)),
                Text('Infected :'+data[index]["infected"].toString(),style:TextStyle(fontSize: 15.0)),
                Text('Recovered :'+data[index]["recoveres"].toString(),style:TextStyle(fontSize:15.0)),
                Text('Deceased :'+data[index]["deceased"].toString(),style:TextStyle(fontSize:15.0))
              ],
            ),
            
            
            ),
                                                               )                                                   //new Text(data[index]["country"]),
          );
          
        },
      ),
    );
  }
}