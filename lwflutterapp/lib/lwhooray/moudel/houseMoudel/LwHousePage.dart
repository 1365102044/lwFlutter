import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwHouseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseWidgets.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';

class LwHousePage extends StatefulWidget {
  @override
  _LwHousePageState createState() => _LwHousePageState();
}

class _LwHousePageState extends State<LwHousePage> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;
  /// 排序
  String _sortType = 'asc';
  /// 区域id
  String _quyuId = '';
  String _cityid = 'd94bba14-dec1-11e5-bcc3-00163e1c066c';
  String _preStayTime = '';

  List<HouseListModel> _houseListModelList = [];
  @override
  void initState() {
    super.initState();

    _getHouseListData();
  }
  void _getHouseListData() async{
    Map<String, dynamic> para = {'preStayTime':_preStayTime,
    'sortFields':'zujin_',
    'sortType':_sortType,
    'quyuId':_quyuId,
    'cityId':_cityid};
    print('\n----para:${para.toString()}');
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_DATA_URL, para, (Response response){
      print('===========house_list:$response');
      LwResponse lwrespose =  LwResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _houseListModelList.clear();
        _houseListModelList.addAll(lwrespose.result.list);
      });
    }, (ErrorModel error){
      print('---error:${error.descption()}');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('房源'),
      ),
      body: Container(
        color: Color(0xfff5f5f5),
        child: RefreshIndicator(
          child: ListView.separated(
            itemCount: _houseListModelList.length,
            itemBuilder: (context,index){
              HouseListModel model = _houseListModelList[index];
              return houseColumsItemWidget(context,model.picObj.big,model.itemName,model.houseItemAddress,model.iosDedicated);
            },
            separatorBuilder: (context,index){
              return Container(
                height: 10.0,
                color: Color(0xfff5f5f5),
              );
            },
          ),
          onRefresh:_refresh,
        ),
      ),
    );
  }


    Future<Null> _refresh() async{
    final Completer<void> completer = Completer();
    Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then((_) {
      _getHouseListData();
    });
  }
}