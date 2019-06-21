import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/widgets/LwYuDingWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseDeatilWidget.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';

class LwZuYueInforPage extends StatefulWidget {
  Function callBackBlock;
  LwRoomInforModel roomInforModel;
  LwZuYueInforPage(this.callBackBlock, {this.roomInforModel});
  @override
  _LwZuYueInforPageState createState() => _LwZuYueInforPageState();
}

class _LwZuYueInforPageState extends State<LwZuYueInforPage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  Function _callBackBlock;
  LwRoomInforModel _roomInforModel;
  Map<String, String> _paramMap = {};
  bool _isAgreeBool = false;
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> _personControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  void initState() {
    super.initState();
    _callBackBlock = widget.callBackBlock;
    _roomInforModel = widget.roomInforModel;

    setState(() {
      _paramMap['houseItemName'] = _roomInforModel.result.houseItemName;
      _paramMap['loudong'] = _roomInforModel.result.louNo +
          '栋' +
          _roomInforModel.result.fangNo +
          '号';
      _paramMap['rent'] = _roomInforModel.result.iosRent;
      Map feeMap = _roomInforModel.result.fee.first;
      feeMap.forEach((k, v) {
        if (k == '电费') {
          _paramMap['dianfei'] = v;
        } else if (k == '水费') {
          _paramMap['shuifei'] = v;
        } else if (k == '押金') {
          _paramMap['yajin'] = v;
        }
      });
    });
  }

  /// 选择日期
  _chooseDate(
    int index,
  ) {
    lwUtils.lwShowDetePicker(context, onConfirm: (date) {
      print('------------------onConfirm:$date');
      setState(() {
        if (index == 1) {
          _paramMap['endtime'] = date;
        } else {
          _paramMap['signTime'] = date;
        }
        _controllers[index - 1].text = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: LWCOLOR.LWCOLOR_BACKGROUND,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return zuyueInforTopWidget(
                          context,
                          _paramMap['houseItemName'],
                          _paramMap['loudong'],
                          _paramMap['rent'] + '元/月',
                          controllers: _controllers, callBack: (index) {
                        _chooseDate(
                          index,
                        );
                      });
                    } else if (index == 1) {
                      return zuyueInforPersonWidger(context,
                          para: _paramMap, controllers: _personControllers);
                    } else {
                      return xiyiwidget(context, _isAgreeBool, () {
                        setState(() {
                          _isAgreeBool = !_isAgreeBool;
                        });
                      });
                    }
                  },
                ),
              ),
            ),
            Container(
              child: getBottomBtnWidget(context, ['上一步', '下一步'],
                  callBackBlock: (text) {
                if (text == '下一步' && !checkParamLegal()) {
                  return;
                }
                FocusScope.of(context).requestFocus(FocusNode());
                _callBackBlock((text == '下一步') ? 2 : 0, _paramMap);
              }),
            )
          ],
        ),
      ),
    );
  }

  bool checkParamLegal() {
    String msg;
    if (lwUtils.lw_isEmpty(_paramMap['endtime'])) {
      msg = '请选选择入住日期';
    } else if (lwUtils.lw_isEmpty(_paramMap['signTime'])) {
      msg = '请选择预计签约时间';
    } else if (lwUtils.lw_isEmpty(_paramMap['zukeName'])) {
      msg = '请输入姓名';
    } else if (lwUtils.lw_isEmpty(_paramMap['zukePhone'])) {
      msg = '请输入手机号';
    } else if (!_isAgreeBool) {
      msg = '请同意协议';
    }
    if (lwUtils.lw_isEmpty(msg)){
      return true;
    }
    lwUtils.showAlertDialog(context, '提示', msg);
    return false;
  }
}
