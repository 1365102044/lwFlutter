import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class d2 extends StatefulWidget{
  @override
  d2State createState() => d2State();
}

class d2State extends State<d2>{  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Center(
          child: new Text('test '),
        ),
      ),
    );
  }


  /**
   * await会阻塞流程，等待紧跟着的的Future执行完毕之后，再执行下一条语句，
   * 而如果用了Future.then这个api，那么就不会等待，
   * 直接执行下面的语句，等Future执行完了，再调用then这个方法。
   */

  @override
  void initState() {
    super.initState();
  //初始化状态，加载用户信息
    print('initState1:${new DateTime.now()}');
    _loaduserInfor();
    print('initState2:${new DateTime.now()}');
  }
  // //模拟异步加载用户信息
  // Future _getuserInfor() async{
  //   await Future.delayed(Duration(milliseconds: 2));
  //   return 'jack';
  // }
  // //加载用户信息，顺便打印时间看看顺序
  // Future _loaduserInfor() async {
  //   print('_loaduserInfor1:${new DateTime.now()}');
  //   print(await _getuserInfor());
  //   print('_loaduserInfor2:${new DateTime.now()}');
  // }

   //模拟异步加载用户信息
  Future _getuserInfor() async{
    new Future.delayed(Duration(milliseconds: 2));
    return 'jack';
  }
  //加载用户信息，顺便打印时间看看顺序
  Future _loaduserInfor() async {
    print('_loaduserInfor1:${new DateTime.now()}');
    _getuserInfor().then((infor){
      print(infor);
    });
    print('_loaduserInfor2:${new DateTime.now()}');
  }
  
}