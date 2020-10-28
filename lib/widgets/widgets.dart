import 'package:COVID/models/models.dart';
import "package:flutter/material.dart";
import 'package:charts_flutter/flutter.dart' as charts;

Widget preventionscard(Color colors, String path, String msg) {
  return Container(
      width: 350,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(width: 3.00, color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: colors,
      ),
      child: Row(
        children: <Widget>[
          Image.asset(path),
          Container(
            width: 190,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(msg,
                      style: TextStyle(fontFamily: "Jost", fontSize: 15)),
                )
              ],
            ),
          )
        ],
      ));
}

Container symptomcard(Color colors, String imgpath, String symptom) {
    return Container(
        margin: EdgeInsets.all(10.0),
        height: 150,
        width: 130,
        decoration: BoxDecoration(
            border: Border.all(width: 1.00, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: colors,
            image: DecorationImage(image: AssetImage(imgpath))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 138.0),
            ),
            Text(symptom,
                style: TextStyle(fontFamily: "Jost", color: Color(0xFF272566))),
          ],
        ));
  }


Widget chart(List<charts.Series<Task, String>> _seriesPieData) {
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


Widget piecard(Color colors, String title, String total,Map<dynamic,dynamic> data) {
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



