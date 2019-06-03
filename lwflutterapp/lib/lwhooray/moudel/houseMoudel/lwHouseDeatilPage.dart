import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class lwHouseDeatilPage extends StatefulWidget {
  final String itemId;
  @override
  _lwHouseDeatilPageState createState() => _lwHouseDeatilPageState();
  lwHouseDeatilPage(this.itemId);
}

class _lwHouseDeatilPageState extends State<lwHouseDeatilPage> {
  // final String itemId = widget.itemId;
  @override
  void initState() {
    super.initState();

    getHouseDeatilData(widget.itemId);
  }

  void getHouseDeatilData(String itemId) async {
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_DEATIL_DATA_URL,
        {"houseItemId": widget.itemId}, (Response response) {
      print('----------housedeatil:$response');
    }, (ErrorModel error) {
      print('----------housedeatil:${error.descption}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源详情',
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme:IconThemeData(
          color: Colors.grey,
        ),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
