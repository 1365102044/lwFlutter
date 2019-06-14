// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lwflutterapp/demo/d2.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(d2());

  double a = 2.11;
  int b = a.toInt();
  int c = a ~/ 1 ;
  print(b);
  print(c);

    // String url = 'http://192.168.1.222/v2/clientAPP/app/banner_promotion';
    // Map <String,dynamic> param = {'equipment':'2'};
    // LwNetworkUtils.getDataWithModel(RequestMethod.POST, url,param, Reslut, (Reslut reslut){
    //   print(reslut.toString());
    // }, (ErrorModel model){
    //   print(model.descption());
    // });

    

    // Response response = await Dio().get('http://www.baidu.com');
    // prints(response);
    

  // List<String> mylist = ['z','b','f','e','a'];
  // mylist.sort((s1,s2){
  //   return s1.compareTo(s2);
  // });
  // print('==============${mylist.toString()}');
  });
}


