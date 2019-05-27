
import 'package:flutter/material.dart';

class Find extends StatefulWidget{
  @override
  FindState createState() => FindState();
}

class FindState extends State<Find>{

  TextStyle sty = TextStyle(backgroundColor: Colors.red);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('发现'),
        ),
        // body: Center(
        //   child: new Text('this is find page'),
        // ),
        body: Column(     // 垂直布局  Row 水平布局
          children: <Widget>[Text('this is find page',style: sty,),
          Text('by row layout',style: sty,)],
        ),
      ),
    );
  }
}