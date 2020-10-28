import 'package:COVID/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../bottomNavigationBar.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A48ED),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/intro.jpg')),
            _buildfooter(),
            Positioned(
                bottom: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigation()));
                  },
                  child: Container(
                      margin: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * .85,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          buildBottomCardText(),
                          buildBottomCardIcon(context)
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildfooter() {
    return Positioned(
      width: MediaQuery.of(context).size.width * .99,
      bottom: 170,
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(
              "Coronavirus disease (COVID-19) is an infectious disease which is swirling its havoc around the world. ",
              style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.white,
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }

  Padding buildBottomCardText() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: text('Get Started',color: Colors.black,fontSize: 18));
    
  }

  Container buildBottomCardIcon(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color(0xFF3A48ED)),
        height: 45,
        width: 45,
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.white,
            )));
  }
}
