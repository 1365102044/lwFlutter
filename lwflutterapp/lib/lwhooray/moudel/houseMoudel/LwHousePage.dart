import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/event/LwHouseEvent.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/lwHouseDeatilPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwHouseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwRegionModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseWidgets.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';

class LwHousePage extends StatefulWidget {
  // 首页过来的数据
  List<ItemListModel> homePageDataModels = [];
  @override
  _LwHousePageState createState() => _LwHousePageState();
  LwHousePage(this.homePageDataModels);
}

class _LwHousePageState extends State<LwHousePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  double _angle1 = 0.5;
  double _angle2 = 0.5;
  Color _timeTextColor = Colors.grey;
  String _timeText = '选择入住时间';
  String _quyuName = '全部区域';
  GlobalKey _anchorKey1 = GlobalKey();
  double _clearBtnWidth = 0.0;

  /// 区域模型数组
  List<RegionModel> _regionList = [];

  /// 排序
  String _sortType = 'asc';

  /// 区域id
  String _quyuId = '';
  String _cityid ;
  // String _preStayTime = '';
  List<dynamic> _houseListModelList = [];
  Map<String, dynamic> _para = {
    'preStayTime': '',
    'sortFields': 'zujin_',
    'sortType': 'asc',
    'quyuId': '',
    'cityId': '',
  };
  @override
  void initState() {
    super.initState();
    
    /// 注册监听 首页切换城市后的操作
    lwEventBus.on<LwHouseEvent>().listen((LwHouseEvent event){
      print('+++++++++++++++++++event:${event.cityid}');
      setState(() {
        _para['cityId'] = _cityid = event.cityid;
        _para['quyuId'] = '';
        _quyuName = '全部区域';
      });
      _getHouseListData();
      _getQuYuListInforByCityData();
    });
    
    if (widget.homePageDataModels != null &&
        widget.homePageDataModels.length != 0) {
      setState(() {
        _houseListModelList.addAll(widget.homePageDataModels);
      });
    } else {
      _getCiytId();
    }
  }

  /// 获取房源列表数据
  void _getHouseListData() async {
    print('\n----para:${_para.toString()}');
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_DATA_URL, _para,
        (Response response) {
      LwResponse lwrespose = LwResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _houseListModelList.clear();
        _houseListModelList.addAll(lwrespose.result.list);
      });
    }, (ErrorModel error) {});
  }

  /// 根据城市ID 获取区域列表
  void _getQuYuListInforByCityData() async {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_FANGYUAN_DATA_LIST_URL, {'cityId': _cityid},
        (Response response) {
      LwRegionModelResponse res =
          LwRegionModelResponse.fromJson(jsonDecode(response.data));
      _regionList.clear();
      _regionList.addAll(res.result.list);
    }, (ErrorModel error) {});
  }

  handleCallBlock(BuildContext context, int index) {
    if (index == 1) {
      setState(() {
        _angle1 = 1;
      });
      List<String> datas = ['全部区域'];
      _regionList.forEach((v) {
        datas.add(v.townName);
      });
      double maxy = lwUtilsFrame().init(_anchorKey1).getMaxY();
      double maxx = lwUtilsFrame().init(_anchorKey1).getMaxX();
      lwUtils.lwpopMenuWidget(context, datas, maxx, maxy,
          callBlackBlock: (newValue) {
        print('+++++++++++popmenu回调+++$newValue+++++++');
        setState(() {
          _angle1 = 0.5;

          if (newValue != null) {
            _quyuName = newValue;
            int index = datas.indexOf(newValue);
            if (index == 0) {
              _para['quyuId'] = '';
            } else {
              RegionModel model = _regionList[index - 1];
              _para['quyuId'] = model.id;
            }
            _getHouseListData();
          }
        });
      });
    } else if (index == 2) {
      setState(() {
        _angle2 = (_angle2 == 0.5) ? 1 : 0.5;
        _para['sortType'] = (_angle2 == 0.5) ? 'asc' : 'desc';
        _getHouseListData();
      });
    } else if (index == 3) {
      lwUtils.lwShowDetePicker(context, onConfirm: (date) {
        setState(() {
          _timeText = date;
          _para['preStayTime'] = _timeText;
          _timeTextColor = Colors.black;
          _clearBtnWidth = 50.0;
          _getHouseListData();
        });
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: lwAppBar('房源'),
      body: Container(
        color: Color(0xfff5f5f5),
        child: Column(
          children: <Widget>[
            NotificationListener<lwHouseTopNotification>(
              onNotification: (notofi) {
                print('+++++++++++++notifi:${notofi.msg}');
                setState(() {
                  _para['preStayTime'] = '';
                  _timeText = '选择入住时间';
                  _timeTextColor = Colors.grey;
                  _clearBtnWidth = 0.0;
                  _getHouseListData();
                });
              },
              child: Container(
                child: houseTopWidget(context, _quyuName, _timeText,
                    angle1: _angle1,
                    angle2: _angle2,
                    anchorKey: _anchorKey1,
                    timeTextColor: _timeTextColor,
                    clearBtnWidth: _clearBtnWidth, callBlackBlock: (index) {
                  handleCallBlock(context, index);
                }),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RefreshIndicator(
                  child: ListView.separated(
                    itemCount: _houseListModelList.length,
                    itemBuilder: (context, index) {
                      String pic;
                      String itemName;
                      String address;
                      String price;
                      String customid;
                      if (_houseListModelList.first.runtimeType ==
                          ItemListModel) {
                        ItemListModel model = _houseListModelList[index];
                        pic = model.itemPic.big;
                        itemName = model.itemName;
                        address = model.itemAddress;
                        price = model.iosItemLowestprice;
                        customid = model.itemId;
                      } else {
                        HouseListModel model = _houseListModelList[index];
                        pic = model.picObj.big;
                        itemName = model.itemName;
                        address = model.houseItemAddress;
                        price = model.iosDedicated;
                        customid = model.customid;
                      }

                      return GestureDetector(
                        child: houseColumsItemWidget(
                            context, pic, itemName, address, price),
                        onTap: () {
                          print('------------customid:$customid');
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LwHouseDeatilPage(customid),
                          ));
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 10.0,
                        color: Color(0xfff5f5f5),
                      );
                    },
                  ),
                  onRefresh: _refresh,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _refresh() async {
    final Completer<void> completer = Completer();
    Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then((_) {
      if (widget.homePageDataModels == null ||
          widget.homePageDataModels.length == 0) {
        _getHouseListData();
        _getQuYuListInforByCityData();
      }
    });
  }

  void _getCiytId() async {
    String cityid = await lwLocalDataUtils.getCurrentCityId();
    print('-----------------cityid:$cityid');
    setState(() {
      _para['cityId'] = _cityid = cityid;
      _getHouseListData();
      _getQuYuListInforByCityData();
    });
  }
}

/// 通知 只能子widget 向父 widget 通信，注意点：发送通知书，
/// context一定要是被监听的子widget的context，
/// 可以使用Build(build:(context){})来获取
class lwHouseTopNotification extends Notification {
  final String msg;
  lwHouseTopNotification(this.msg);
}
