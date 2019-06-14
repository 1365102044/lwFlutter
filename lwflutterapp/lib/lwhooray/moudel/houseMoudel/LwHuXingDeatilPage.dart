import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/lwYuYuePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwHuXingDeatilModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHuXingDeatilWidget.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/lwProgressDialog.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class lwHuXingDeatilPage extends StatefulWidget {
  String huxingid;
  lwHuXingDeatilPage(this.huxingid);
  @override
  _lwHuXingDeatilPageState createState() => _lwHuXingDeatilPageState();
}

class _lwHuXingDeatilPageState extends State<lwHuXingDeatilPage> {
  bool _loading = true;
  List<lwSwiperModel> _brannerList = [];
  List<RoomTypePeizhi> _roomPeiZhiList = [];
  Result _huxingResult;

  /// 是否收藏
  bool _isCollectBool = false;
  String _collectionId = '';
  String _userPhone = '';
  String _userName = '';
  @override
  void initState() {
    super.initState();
    _getHuXingDatas(widget.huxingid);
  }

  _getUserInfor() async{
    String phone =
        await lwLocalDataUtils.getData(ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY);
    String username =
        await lwLocalDataUtils.getData(ACCOUNT_INFOR_NICKNAME_LOCAL_DATA_KEY);
    setState(() {
      _userPhone = phone ?? '';
      _userName = username ?? '';
    });
  }

  void _getHuXingDatas(String huxingid) async {
    print('+++++++++++++++huxingid:$huxingid');
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_HUXING_LIST_DEATIL_DATA_URL, {'id': huxingid},
        (Response response) {
      lwHuXingDeatilModelResponse res =
          lwHuXingDeatilModelResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _huxingResult = res.result;
        _loading = false;
        res.result.pic.forEach((v) {
          _brannerList.add(lwSwiperModel(v.big));
        });
        _roomPeiZhiList.addAll(res.result.roomTypePeizhi);
        _collectionId = res.result.collectionId ?? '';
        _isCollectBool = res.result.collectionStatus == 1;
      });
    }, (ErrorModel error) {
      setState(() {
        _loading = false;
      });
    });
  }

  /// 收藏
  _collectRequest() async {
    lwLocalDataUtils().isLoginStatue(context);
    _getUserInfor();
    String url = LWAPI.HOUSE_ADD_HUXING_COLLECT_URL;
    if (_isCollectBool) {
      url = LWAPI.HOUSE_CANCLE_HUXING_COLLECT_URL;
    }
    Map<String, String> para = {
      'roomTypeId': widget.huxingid,
      'houseUserName': _userName ?? '',
      'phone': _userPhone ?? '',
      'collectionId': _collectionId,
    };
    setState(() {
      _loading = true;
    });
    LwNetworkUtils.requestDataWithPost(url, para, (Response response) {
      lwAddCollectResponse res = lwAddCollectResponse.fromJson(jsonDecode(response.data));
      if (res.status.code == '200') {
      setState(() {
        _isCollectBool = !_isCollectBool;
        if(_isCollectBool) {
           _collectionId = res.result ?? '';
        }
      });  
      }
      setState(() {
      _loading = false;
    });
    }, (ErrorModel error) {
      setState(() {
      _loading = false;
    });
    });
  }

  /// 获取房间信息 转成widget需要的数据格式
  List<Map<String, String>> _getRoomInforDatas() {
    List<Map<String, String>> datas = [];
    datas.add({'assets/house/hezhu.png': _huxingResult.huXing.key});
    datas.add({'assets/house/jingzhuang.png': _huxingResult.zhuangXiu.key});
    datas.add({'assets/house/pingmi.png': _huxingResult.iosRoomTypeArea + '㎡'});
    return datas;
  }

  List<Map<String, String>> _getRoomPeiZhiDatas() {
    List<Map<String, String>> datas = [];
    _huxingResult.roomTypePeizhi.forEach((v) {
      String path = 'assets/house/sheshi/' + v.peizhi + '.png';
      datas.add({path: v.peizhi});
    });
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('户型详情'),
      body: lwProgressDialog(
          loading: _loading,
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    // padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      child: Column(
                        children: _getSonWidgets(),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: lwFillButton('预约', () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => lwYuYuePage(),));
                            
                          },
                              backColor: Colors.white,
                              textcolor: Colors.red,
                              borderColor: Colors.red,
                              borderWidth: 1,
                              radius: 6),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: lwFillButton(
                            '预定',
                            () {},
                            radius: 6,
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  _getSonWidgets() {
    List<Widget> sonwidgets = [];
    if (_huxingResult != null) {
      sonwidgets.add(
        LwSwiperWidget(context, _brannerList),
      );
      sonwidgets.add(
        huxingInforsWidget(
          context,
          _huxingResult.roomTypeName,
          _huxingResult.shi.toString() +
              '室' +
              _huxingResult.ting.toString() +
              '厅',
          _huxingResult.iosMinZujin + '元起',
          iscollect: _isCollectBool,
          callBlackBlock: _collectRequest,
        ),
      );
      if (_getRoomInforDatas().length != 0) {
        sonwidgets.add(
          huxingRoomInforWidget(context, '房间信息', _getRoomInforDatas()),
        );
      }
      if (_getRoomPeiZhiDatas().length != 0) {
        sonwidgets.add(
          huxingRoomInforWidget(context, '房间配套', _getRoomPeiZhiDatas()),
        );
      }

      sonwidgets.add(
        huxingOtherInforWidger(context, '房型简介', _huxingResult.roomTypeIntro),
      );
      sonwidgets.add(
        huxingOtherInforWidger(context, '保障', '100%真实房源，100%免佣金',
            textcolor: Colors.red),
      );
    } else {
      Container();
    }
    return sonwidgets;
  }
}
