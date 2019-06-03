

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class lwHouseDeatilPage extends StatefulWidget {
  final String itemId ;
  @override
  _lwHouseDeatilPageState createState() => _lwHouseDeatilPageState();
  lwHouseDeatilPage(this.itemId);
}

class _lwHouseDeatilPageState extends State<lwHouseDeatilPage> {

  // final String itemId = widget.itemId;
  @override
  void initState() {
    super.initState();


  }

  void getHouseDeatilData(String itemId){
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_DEATIL_DATA_URL, {"houseItemId":widget.itemId}, (Response response){

    }, (ErrorModel error){
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}