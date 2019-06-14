import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwHouseDeatilModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseDeatilWidget.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/lwProgressDialog.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class LwHouseDeatilPage extends StatefulWidget {
  final String itemId;
  @override
  _LwHouseDeatilPageState createState() => _LwHouseDeatilPageState();
  LwHouseDeatilPage(this.itemId);
}

class _LwHouseDeatilPageState extends State<LwHouseDeatilPage> {
  List<lwSwiperModel> _bannerList = [];
  LwHouseDeatilModel _houseDeatilModel;
  bool _loading = true;
  @override
  void initState() {
    super.initState();

    getHouseDeatilData(widget.itemId);
  }

  void getHouseDeatilData(String itemId) async {
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_DEATIL_DATA_URL,
        {"houseItemId": widget.itemId}, (Response response) {
      setState(() {
        _loading = false;
        _houseDeatilModel =
            LwHouseDeatilModel.fromJson(jsonDecode(response.data));
        _houseDeatilModel.result.picArr.forEach((v) {
          _bannerList.add(lwSwiperModel(v.big));
        });
      });
    }, (ErrorModel error) {
      setState(() {
        _loading = false;
      });
    });
  }

  /// 获取设施数据 转成组件需要的数据格式
  List<Map<String, String>> _getsheshiData() {
    List<Map<String, String>> datas = [];
    _houseDeatilModel.result.sheshiArr.forEach((v) {
      String path = 'assets/house/sheshi/' + v.name + '.png';
      datas.add({path: v.name});
    });
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('房源详情'),
      body: lwProgressDialog(
        loading: _loading,
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: getNumber(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return houseDeatilSwiperWidget(
                            context,
                            _bannerList,
                            _houseDeatilModel.result.hiItemName,
                            _houseDeatilModel.result.itemStatus);
                      }
                      if (index == 1) {
                        return aboutUsWidget(
                            context,
                            _houseDeatilModel.result.mendianPhone,
                            _houseDeatilModel.result.hiItemName,
                            lat: _houseDeatilModel.result.lat,
                            lng: _houseDeatilModel.result.lng);
                      }
                      if (index == 2) {
                        return basicsInforWidget(
                            context, _getsheshiData());
                      }
                      if (index == 3) {
                        return moreHuxingWidget(
                            context, _houseDeatilModel.result.roomTypeArr);
                      }
                      if (index == 4) {
                        return zhouBianWidget(
                            _houseDeatilModel.result.hiZhoubianDesc);
                      }
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  color: Colors.white,
                  child: GestureDetector(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: GestureDetector(
                        child: Text(
                          '联系管家',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    onTap: callPhone,
                  ),
                )
              ],
            )),
      ),
    );
  }

  /// 打电话
  callPhone() async {
    String url = 'tel:' + _houseDeatilModel.result.mendianPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not lunch $url';
    }
  }

  int getNumber() {
    int number = 0;
    if (_houseDeatilModel == null) {
      return number = 0;
    }
    if (_houseDeatilModel != null) number = 4;
    if (_houseDeatilModel.result.roomTypeArr != null &&
        _houseDeatilModel.result.roomTypeArr.length != 0) number += 1;
    return number;
  }
}
