import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';
import 'widgets/widgets.dart';

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
    buildChart();
    print(statsIndia);
    setState(() {});
    return "Sucesss!";
  }

  void buildChart() {
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
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  statsContainer(),
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
                      child: buildSyptomsCardListView(),
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

  

  Container statsContainer() {
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
                chart(_seriesPieData),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    piecard(Color(0xFF003cbf), "Confirmed",
                                        "totalCases", data),
                                    piecard(Color(0xFF06cafd), "Recovered",
                                        "recovered", data),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    piecard(Color(0xFFff5c4d), "Deaths",
                                        "deaths", data),
                                    piecard(Colors.amber, "Active",
                                        "activeCases", data)
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
}
