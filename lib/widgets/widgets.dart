import 'package:COVID/models/models.dart';
import "package:flutter/material.dart";
import 'package:charts_flutter/flutter.dart' as charts;

Text text(String label,{double fontSize=25,Color color=Colors.black}) {
  return Text(
    label,
    style: TextStyle(fontFamily: "Montserrat",fontSize: fontSize,color:color),
  );
}

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
                                labelPosition: charts.ArcLabelPosition.outside,
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

Widget piecard(
    Color colors, String title, String total, Map<dynamic, dynamic> data) {
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
                        fontSize: 20, color: Colors.white, fontFamily: "Jost"))
              ],
            ),
            Text('${data[total].toString()} ',
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: "Cookie"))
          ],
        )),
  );
}

ListView buildSyptomsCardListView() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      symptomcard(Color(0xFF3490DC), "assets/images/lung.gif", "Breathing"),
      Padding(
        padding: EdgeInsets.all(5.0),
      ),
      symptomcard(Color(0xFFFFCDD2), "assets/images/therm.gif", "Fever"),
      Padding(
        padding: EdgeInsets.all(5.0),
      ),
      symptomcard(Color(0xFF336BEB), "assets/images/cough.gif", "Cough"),
      Padding(
        padding: EdgeInsets.all(5.0),
      ),
      symptomcard(
          Color(0xFFDA5571), "assets/images/sorethroat.gif", "Sore Throat")
    ],
  );
}

SafeArea buildPieCardsGrid(Map<dynamic, dynamic> data) {
  return SafeArea(
    child: Center(
      child: Container(
        width: 380,
        height: 320,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                piecard(Color(0xFF003cbf), "Confirmed", "totalCases", data),
                piecard(Color(0xFF06cafd), "Recovered", "recovered", data),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                piecard(Color(0xFFff5c4d), "Deaths", "deaths", data),
                piecard(Colors.amber, "Active", "activeCases", data)
              ],
            ),
            Text(
              "* Data from lead sources",
              style: TextStyle(fontFamily: "Jost", fontSize: 15),
            ),
          ],
        ),
      ),
    ),
  );
}

SafeArea buildPreventionsCardListView() {
  return SafeArea(
    child: Column(
      children: <Widget>[
        preventionscard(Color(0xFFd4ffea), "assets/images/masks.gif",
            "Wear a mask always to prevent the risks of being infected."),
        Padding(padding: EdgeInsets.all(5.0)),
        preventionscard(Color(0xFFc6f9fd), "assets/images/sanitise.gif",
            "Wash your hands with alcohol-based hand sanitizer to demolish those serial killers off of your hands."),
        Padding(padding: EdgeInsets.all(5.0)),
        preventionscard(Color(0xFFfbd5d3), "assets/images/socialdistancing.gif",
            "Practice Social Distancing and stay atleast 2 metres apart from people."),
        Padding(padding: EdgeInsets.all(5.0)),
        preventionscard(Color(0xFFf4c540), "assets/images/quarantine.gif",
            "Sit back on your couch and Chill. #StayHome&StaySafe"),
        Padding(padding: EdgeInsets.all(5.0))
      ],
    ),
  );
}
