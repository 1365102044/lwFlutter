
import 'package:flutter/material.dart';

class Me extends StatefulWidget{

  @override
  MeState createState() => MeState();
}
class MeState extends State<Me>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
        ),
        body: Center(child: new Text('this is me page',style: new TextStyle(backgroundColor: Colors.red),),)
      ),
    );
  }
}