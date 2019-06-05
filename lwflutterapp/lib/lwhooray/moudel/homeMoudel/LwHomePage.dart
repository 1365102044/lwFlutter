import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'dart:convert';

class LwHomePage extends StatefulWidget {
  @override
  _LwHomePageState createState() => _LwHomePageState();
}

class _LwHomePageState extends State<LwHomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  List<lwSwiperModel> _bannerList = [];
  List<RoomTypeListModel> _roomList = [];
  List<ItemListModel> _itemlist = [];

  @override
  void initState() {
    super.initState();

    /// banner 图
    _getBannerList();
    _getTuiJianList();
  }

  void _getTuiJianList() async {
    LwNetworkUtils.requestDataWithPost(LWAPI.HOME_TUIJIAN_URL, {
      'cityId': 'd94bba14-dec1-11e5-bcc3-00163e1c066c'
    }, (Response response) {
      LwResponse lwresponse = LwResponse.fromJson(jsonDecode(response.data));
      print('-------------${response.toString()}');
      setState(() {
        _itemlist.clear();
        _roomList.clear();
        _roomList.addAll(lwresponse.result.roomTypeList);
        _itemlist.addAll(lwresponse.result.itemList);
      });
    }, (ErrorModel error) {
      print('-----------${error.descption()}');
    });
  }
int getNumber(){
  if(_itemlist.length == 0 &&_roomList.length == 0){
    return 2;
  }else if(_itemlist.length != 0 && _roomList.length != 0){
  return 4;
  }else{
    return 3;
  }
}
  /// banner 数据
  void _getBannerList() async {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOME_BANNER_URL, {'equipment': '2'}, (Response response) {
      LwResponse lwresponse = LwResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _bannerList.clear();
        lwresponse.result.bannerPicList.forEach((v){
          _bannerList.add(lwSwiperModel(v.picUrl));  
        });
      });
    }, (ErrorModel error) {
      print(error.descption());
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: lwAppBar('首页'),
      body: Container(
          color: Color(0xfff5f5f5),
          child: RefreshIndicator(
            child: ListView.separated(
              itemCount: getNumber(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return LwSwiperWidget(context, _bannerList);
                } else if (index == 1) {
                  return HomeFuncItemsWidget(context);
                } else if (index == 2) {
                  return HomeColumsItemWidget(context, _itemlist);
                } else if (index == 3) {
                  return HomeColumsItemWidget(context, _roomList);
                }
                return Container(
                  height: 100.0,
                  color: Colors.blue,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: (index == 1 || index == 2) ? 10 : 0,
                  color: Color(0xFFf5f5f5),
                );
              },
            ),
            onRefresh: _refresh,
          )),
    );
  }

  Future<Null> _refresh() async{
    final Completer<void> completer = Completer();
    Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then((_) {
      _getBannerList();
      _getTuiJianList();
    });
  }
}
