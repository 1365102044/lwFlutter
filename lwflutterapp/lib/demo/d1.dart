

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Lwview1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '呵呵哒',
      theme: ThemeData(primaryColor: Colors.white),
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SamplePageState();
}

class SamplePageState extends State<SamplePage>{
  String showStr = 'i love jack';
  bool _flag = false;
  void _changeShowStr(){
    setState(() {
      if (_flag){
        showStr = 'Object-C is baster launge，大件垃圾的拉水电费拉水电费卡收到货按时发达收到货发可适当阿萨德话费卡收到货费';
      }else{
        showStr = 'flutter is baster launge，爱上了对方哈斯；好地方；阿萨德回复；暗示法好；合肥项目，像没穿VB阿斯顿发哈咖啡店';
      }
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('i love flutter-='),
      ),
      body: Center(child: Text(showStr,
          textAlign: TextAlign.left,
          // maxLines: 1,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            color: Colors.red,
            // letterSpacing: 20,  //字间距
            wordSpacing: 10, //词间距
          ),  
      ),),

      floatingActionButton: FloatingActionButton(
        onPressed: _changeShowStr,
        tooltip: 'update text',
        child: Icon(Icons.update),
      ),
    );
  }
}
