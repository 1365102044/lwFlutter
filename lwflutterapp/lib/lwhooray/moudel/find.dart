
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
        body: Text('this is find page',style: sty,
        ),
      ),
    );
  }
}