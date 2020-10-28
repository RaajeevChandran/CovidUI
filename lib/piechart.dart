import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'helpers/widgets.dart';

class Task {
  String task;
  int taskvalue;
  Color colors;
  Task({this.task, this.taskvalue, this.colors});
}

class Res extends StatefulWidget {
  @override
  _ResState createState() => _ResState();
}

class _ResState extends State<Res> {
  Map data = {};
  Map<String, dynamic> statsIndia;
  List<charts.Series<Task, String>> _seriesPieData =
      List<charts.Series<Task, String>>();
  int a, b, c;
  var days = DateTime.now().day;
  var month = DateTime.now().month;
  List months = [
    " ",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"),
        headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    statsIndia = data;
    a = statsIndia["totalCases"];
    b = statsIndia["recovered"];
    c = statsIndia["deaths"];
    print(a);
    get();
    print(statsIndia);
    setState(() {});
    return "Sucesss!";
  }

  void get() {
    print("a is $a , b is $b, c is $c");
    var piedata = [
      new Task(task: "Confirmed", taskvalue: a, colors: Color(0xFF003cbf)),
      new Task(task: "Recovered", taskvalue: b, colors: Color(0xFF06cafd)),
      new Task(task: "Deaths", taskvalue: c, colors: Color(0xFFff5c4d))
    ];
    _seriesPieData.add(charts.Series(
      data: piedata,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskvalue,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colors),
      id: "India",
      labelAccessorFn: (Task row, _) => '${row.taskvalue}',
    ));
    print("Length is ${_seriesPieData.length}");
  }



  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF3a48ed),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  firstcontainer(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 210.0),
                    child: Text("Symptoms",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 25,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 5.0),
                  SafeArea(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0))),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          symptomcard(Color(0xFF3490DC),
                              "assets/images/lung.gif", "Breathing"),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          symptomcard(Color(0xFFFFCDD2),
                              "assets/images/therm.gif", "Fever"),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          symptomcard(Color(0xFF336BEB),
                              "assets/images/cough.gif", "Cough"),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                          ),
                          symptomcard(Color(0xFFDA5571),
                              "assets/images/sorethroat.gif", "Sore Throat")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0),
                    child: Text("Preventions",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 25,
                            color: Colors.white)),
                  ),
                  SizedBox(height: 10.0),
                  SafeArea(
                    child: Column(
                      children: <Widget>[
                        preventionscard(
                            Color(0xFFd4ffea),
                            "assets/images/masks.gif",
                            "Wear a mask always to prevent the risks of being infected."),
                        Padding(padding: EdgeInsets.all(5.0)),
                        preventionscard(
                            Color(0xFFc6f9fd),
                            "assets/images/sanitise.gif",
                            "Wash your hands with alcohol-based hand sanitizer to demolish those serial killers off of your hands."),
                        Padding(padding: EdgeInsets.all(5.0)),
                        preventionscard(
                            Color(0xFFfbd5d3),
                            "assets/images/socialdistancing.gif",
                            "Practice Social Distancing and stay atleast 2 metres apart from people."),
                        Padding(padding: EdgeInsets.all(5.0)),
                        preventionscard(
                            Color(0xFFf4c540),
                            "assets/images/quarantine.gif",
                            "Sit back on your couch and Chill. #StayHome&StaySafe"),
                        Padding(padding: EdgeInsets.all(5.0))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  

  

  Container firstcontainer() {
    return Container(
        height: 870,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)),
        ),
        child: Column(
          children: <Widget>[
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text("COVID-19",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        color: Colors.black,
                      )),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 55.0),
                      child: Text(
                          "Today's Statistics (${days.toString()} ${months[month]} 2020)",
                          style: TextStyle(fontSize: 17, fontFamily: "Jost")),
                    ),
                    Container(
                        height: 40,
                        width: 40,

                        //  color:Colors.black,
                        child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                chart(),
                SizedBox(height: 15),
                _seriesPieData.length > 0
                    ? SafeArea(
                        child: Center(
                          child: Container(
                            width: 380,
                            height: 320,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    piecard(
                                      Color(0xFF003cbf),
                                      "Confirmed",
                                      "totalCases",
                                    ),
                                    piecard(Color(0xFF06cafd), "Recovered",
                                        "recovered"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    piecard(
                                        Color(0xFFff5c4d), "Deaths", "deaths"),
                                    piecard(
                                        Colors.amber, "Active", "activeCases")
                                  ],
                                ),
                                Text(
                                  "* Data from lead sources",
                                  style: TextStyle(
                                      fontFamily: "Jost", fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            )
          ],
        ));
  }

  Widget piecard(Color colors, String title, String total) {
    return SafeArea(
      child: Container(
          width: 160,
          margin: EdgeInsets.all(15),
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.amber,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    width: 18,
                    height: 18,
                    color: colors,
                  ),
                  Text(title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Jost"))
                ],
              ),
              Text('${data[total].toString()} ',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: "Cookie"))
            ],
          )),
    );
  }

  Widget chart() {
    return Container(
        padding: EdgeInsets.all(5.0),
        width: 400,
        height: 350,
        child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Container(
                child: Center(
                    child: Column(
              children: <Widget>[
                _seriesPieData.length > 0
                    ? Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(milliseconds: 1500),
                          behaviors: [
                            new charts.DatumLegend(
                              outsideJustification:
                                  charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 3,
                              cellPadding:
                                  new EdgeInsets.only(left: 15.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.black,
                                  fontFamily: "Jost",
                                  fontSize: 13),
                            ),
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 50,
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator(
                                  labelPosition:
                                      charts.ArcLabelPosition.outside,
                                )
                              ]),
                        ),
                      )
                    : Container(
                        width: 250,
                        height: 250,
                        child: Center(
                            child: Image.asset("assets/images/load.gif",
                                fit: BoxFit.cover))),
              ],
            )))));
  }
}
