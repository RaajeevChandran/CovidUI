import "package:flutter/material.dart";

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



