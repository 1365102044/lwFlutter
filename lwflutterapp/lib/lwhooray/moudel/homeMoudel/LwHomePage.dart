import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwCityListModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwAppBarForHomePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/event/LwHouseEvent.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'dart:convert';

import 'LwCityListPage.dart';

class LwHomePage extends StatefulWidget {
  @override
  _LwHomePageState createState() => _LwHomePageState();
}

class _LwHomePageState extends State<LwHomePage>
    with AutomaticKeepAliveClientMixin {
  List<CityList> _cityInfors = [];
  bool get wantKeepAlive => true;
  List<lwSwiperModel> _bannerList = [];
  List<RoomTypeListModel> _roomList = [];
  List<ItemListModel> _itemlist = [];
  String _localCity ;
  String _cityId;
  // 1. 创建 globalKey
  GlobalKey<lwAppBarForHomePageState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    lwThridRegisterUtil.register();
    _getCurrentCityId();
  }

  void _getCurrentCityId() async{
  String cityname = await lwLocalDataUtils.getCurrentCityName();
  String cityid = await lwLocalDataUtils.getCurrentCityId();
    setState(() {
      _localCity = cityname;
      _cityId = cityid;
      globalKey.currentState.changeLeftText(_localCity);
      print('**lw***********cityname*************');
      print(cityname);
      print('*************cityname***********lw**');
    });
    _getBannerList();
    _getTuiJianList();  
    _getCityInforList();
  }
  /// 城市列表
  void _getCityInforList() async {
    LwNetworkUtils.requestDataWithPost(LWAPI.HOME_CITY_DATA_LIST_URL, {},
        (Response response) {
      LwCityListModel cityResponseModel =
          LwCityListModel.fromJson(jsonDecode(response.data));
          _cityInfors.clear();
      _cityInfors.addAll(cityResponseModel.result.list);
    }, (ErrorModel error) {});
  }
  /// 推荐
  void _getTuiJianList() async {
    LwNetworkUtils.requestDataWithPost(LWAPI.HOME_TUIJIAN_URL, {
      'cityId': _cityId
    }, (Response response) {
      LwResponse lwresponse = LwResponse.fromJson(jsonDecode(response.data));
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

  int getNumber() {
    if (_itemlist.length == 0 && _roomList.length == 0) {
      return 2;
    } else if (_itemlist.length != 0 && _roomList.length != 0) {
      return 4;
    } else {
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
        lwresponse.result.bannerPicList.forEach((v) {
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
      appBar: lwAppBarForHomePage(
        '首页',
        key: globalKey,
        leftText: _localCity ?? '',
        callBlackBlock: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => LwCityPage(_cityInfors,_localCity)))
              .then((cityModel) {
                /// 发送
              print(lwEventBus);
              lwEventBus.fire(LwHouseEvent(cityModel.id));
            setState(() {
              _localCity = cityModel.name;
              _cityId = cityModel.id;
              globalKey.currentState.changeLeftText(cityModel.name);
            });
            lwLocalDataUtils.saveCurrentCityInfor(cityModel.id, cityModel.name);
            _refresh();
          });
        },
      ),
      body: Container(
          color: Color(0xfff5f5f5),
          child: RefreshIndicator(
            child: ListView.separated(
              itemCount: getNumber(),
              itemBuilder: (BuildContext context,int index) {
                if (index == 0) {
                  return LwSwiperWidget(context, _bannerList);
                } else if (index == 1) {
                  return HomeFuncItemsWidget(context,callBlackBlock: (String name){
                     print('-----------点击了$name-----------');
                  });
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

  Future<Null> _refresh() async {
    final Completer<void> completer = Completer();
    Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then((_) {
      _getBannerList();
      _getTuiJianList();
      _getCityInforList();
      lwMapUtil.startLocation();
      _getCurrentCityId();
    });
  }
}
