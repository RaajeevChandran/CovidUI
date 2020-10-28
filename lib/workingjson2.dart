import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home:App()));

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('sdfd')),
        body:Stack(
          children: <Widget>[
        
                         
                        Wrap(
                                                      children:<Widget>[
                                                        Container(
                                           height:150,
                                           child:ListView(
                                             scrollDirection: Axis.horizontal,
                                             children: <Widget>[
                                               buildColumn('assets/images/IMG_20180414_222714_671.jpg'),
                                               Padding(padding: EdgeInsets.all(5.0),),
                                               buildColumn('assets/images/ezgif.com-video-to-gif.gif'),
                                                 Padding(padding: EdgeInsets.all(5.0),),
                                               buildColumn('assets/images/ezgif.com-video-to-gif.gif'),
                                                 Padding(padding: EdgeInsets.all(5.0),),
                                               buildColumn('assets/images/ezgif.com-video-to-gif.gif'),
                                                 Padding(padding: EdgeInsets.all(5.0),),
                                               buildColumn('assets/images/ezgif.com-video-to-gif.gif')
                                             ],
                                           )
                            ),
                                                      ]
                          )
                               
                               
                             ],
                           )
                        
          
      );
    
  }

  Widget buildColumn(String path) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                               Container(
                                                 width:100,
                                                 height:100,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.all(Radius.circular(10)),
                                                   gradient: LinearGradient(
                                                     colors:[
                                                       Colors.blueGrey,
                                                       Colors.brown
                                                       
                                                     ],
                                                     begin:Alignment.topCenter,
                                                     end:Alignment.bottomCenter,
                                                     
                                                   ),
                                                   
                                                 border:Border.all(color: Colors.white),
                                                 
                                                 ),
                                                 
                                                 child:Image.asset(path),
                                                 
                                               ),
                                             ],
                                           );
  }

  
}