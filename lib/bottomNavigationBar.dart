import 'package:COVID/stats.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'piechart.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex=1;
  List<Widget> _children=[Stats(),Res(),News()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index:1,
        height:50,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.easeIn,
        items: [Icon(Icons.insert_chart),Icon(Icons.home),Icon(Icons.map)],
        backgroundColor: Color(0xFF3a48ed),
        onTap:(index){
          setState(() {
            _currentIndex=index;
          });
        }
        ),
        body:_children.elementAt(_currentIndex)
        
    );
  }
}



class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child:Text("News"))
    );
  }
}



class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
child:Center(child:Text("sttas"))
    );
  }
}