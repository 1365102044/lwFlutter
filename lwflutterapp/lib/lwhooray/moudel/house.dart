
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class House extends StatefulWidget{

  HouseState createState() => HouseState();
}

class HouseState extends State<House>{

String showtext = 'this is house page';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('房源'),
        ),
        body: Center(child: new Text(showtext),)
      ),
    );
  }

@override
  void initState() {
    super.initState();
    // 延迟 执行
    Future.delayed(Duration(seconds:3),(){
    setState(() {
      this.showtext = 'this is change after text!';
    });
    });
  }

}