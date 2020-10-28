import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/models.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Map data = {};
  Map<String, dynamic> dailyStats;
  int a, b, c;
  List<charts.Series<DailyCases, int>> _seriesLineData =
      List<charts.Series<DailyCases, int>>();
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"), //https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search

        headers: {"Accept": "application/json"});

    data = json.decode(response.body);
    dailyStats = data;
    a = dailyStats["totalCases"];
    b = dailyStats["recovered"];
    c = dailyStats["deaths"];
    print(a);
    get();
    print(dailyStats);

    return "Sucesss!";
  }

  void get() {
    //Not random values, real statistic data scraped using Python. :)
    List<int> marchconfirmeddata = [
      1111,
      3,
      5,
      6,
      28,
      30,
      31,
      34,
      39,
      48,
      63,
      71,
      81,
      91,
      102,
      112,
      126,
      146,
      171,
      198,
      256,
      334,
      403,
      497,
      571,
      657,
      730,
      883,
      1019,
      1139,
      1326,
      1635
    ];
    List<int> marchdeceaseddata = [
      1111,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      1,
      2,
      2,
      2,
      3,
      3,
      4,
      4,
      4,
      7,
      9,
      10,
      11,
      16,
      19,
      24,
      27,
      41,
      47
    ];
    List<int> marchrecovereddata = [
      1111,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      4,
      4,
      10,
      10,
      13,
      14,
      15,
      15,
      20,
      23,
      23,
      23,
      25,
      40,
      43,
      50,
      75,
      85,
      102,
      137,
      150
    ];

    List<DailyCases> marchconfirmed = [];
    List<DailyCases> marchdeceased = [];
    List<DailyCases> marchrecovered = [];

    for (int i = 1; i < 32; i++) {
      marchconfirmed.add(new DailyCases(date: i, val: marchconfirmeddata[i]));
      marchdeceased.add(new DailyCases(date: i, val: marchdeceaseddata[i]));
      marchrecovered.add(new DailyCases(date: i, val: marchrecovereddata[i]));
    }

    _seriesLineData.add(charts.Series(
      data: marchconfirmed,
      domainFn: (DailyCases task, _) => task.date,
      measureFn: (DailyCases task, _) => task.val,
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.blue),
      id: "March Confirmed data",
    ));

    _seriesLineData.add(charts.Series(
      data: marchdeceased,
      domainFn: (DailyCases task, _) => task.date,
      measureFn: (DailyCases task, _) => task.val,
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.red),
      id: "March Deceased data",
    ));

    _seriesLineData.add(charts.Series(
      data: marchrecovered,
      domainFn: (DailyCases task, _) => task.date,
      measureFn: (DailyCases task, _) => task.val,
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.green),
      id: "March recovered data",
    ));
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 400,
          height: 400,
          padding: EdgeInsets.all(10.0),
          child: Container(
              child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: charts.LineChart(
                  _seriesLineData,
                  defaultRenderer: charts.LineRendererConfig(
                      includeArea: true, stacked: true),
                  animate: true,
                  animationDuration: Duration(milliseconds: 3000),
                  behaviors: [
                    charts.ChartTitle('People',
                        behaviorPosition: charts.BehaviorPosition.start,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                    charts.ChartTitle('Days(March)',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea)
                  ],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}


