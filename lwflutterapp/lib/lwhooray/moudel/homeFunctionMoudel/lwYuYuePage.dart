import 'dart:convert';
import 'dart:core' ;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/lwHuXingInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/lwProjectsInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/viewModel/LwHouseInforViewModel.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class lwYuYuePage extends StatefulWidget {
  @override
  _lwYuYuePageState createState() => _lwYuYuePageState();
}

/// seeTime name phone
class _lwYuYuePageState extends State<lwYuYuePage> {
  TextEditingController _textEditingController_phone =
      new TextEditingController();
  TextEditingController _textEditingController_name =
      new TextEditingController();
  Map<String, String> _paramMap = {
    'needRemark': '',
    'age': '',
    'seeTime': '',
    'name': '',
    'phone': '',
    'roomTypeId': '',
    'itemId': '',
  };
  String _accountphone = '';
  String _phonePlaceHodler = '请输入手机号';
  ///loginCellPhone
  String _mendianText = '请选择门店';
  String _huxingText = '请选择户型';
  String _wantTimeText = '选择时间';
  List<ListModel> _projectList = [];
  List<HuXingModel> _huxingList = [];
  LwHouseInforViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = LwHouseInforViewModel();
    getPhone();

    /// 获取项目数据
    _viewModel.getProjectInfor(callBackBlcok:(projects) {
      setState(() {
        _projectList.addAll(projects);
      });
    });
  }

  getPhone() async {
    String phone = await lwLocalDataUtils.getData(
      ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY,
    );
    setState(() {
      _textEditingController_phone.text = phone;
      _paramMap['phone'] = phone;
      if(phone.isEmpty){
        _phonePlaceHodler = '请输入手机号';
      }
      print('------------_accountphone:$_accountphone');
    });
  }

  /// 选择门店
  chooseProject() {
    List<String> datasProjectName = [];
    _projectList.forEach((v) {
      datasProjectName.add(v.houseItemName);
    });
    lwShowAlertList(context, '选择门店', datasProjectName,
        callBlackBlock: (int index) {
      _viewModel.getHuXingInforByProjectId(_projectList[index].id, callBackBlcok:(huxings) {
        setState(() {
          _huxingList.addAll(huxings);
        });
      });
      _paramMap['itemId'] = _projectList[index].id;
      setState(() {
        _mendianText = _projectList[index].houseItemName;
        _huxingText = '请选择户型';
        _paramMap['roomTypeId'] = '';
      });
    });
  }

  /// 选择户型
  choosehuXing() {
    if (_paramMap['itemId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择门店',
        '未选择门店',
      );
      return;
    }
    List<String> datasHuXingName = [];
    _huxingList.forEach((v) {
      datasHuXingName.add(v.roomTypeName);
    });
    lwShowAlertList(context, '选择户型', datasHuXingName,
        callBlackBlock: (int index) {
          print('**lw***********_huxingList[index].roomTypeId*************');
          print(_huxingList[index].roomTypeId);
          print('*************_huxingList[index].roomTypeId***********lw**');
      _paramMap['roomTypeId'] = _huxingList[index].roomTypeId;
      _paramMap['itemId'] = _huxingList[index].roomTypeId;
      setState(() {
        _huxingText = _huxingList[index].roomTypeName;
      });
    });
  }

  /// 选择日期
  chooseDate() {
    lwUtils.lwShowDetePicker(context, onChanged: (date) {
      print('-------------onchanged:$date');
    }, onConfirm: (date) {
      print('------------------onConfirm:$date');
      setState(() {
        _wantTimeText = date;
        _paramMap['seetTime'] = date;
      });
    });
  }

  /// 提交信息
  commitInfor() {
    print('------------_paramMap:');
    print(_paramMap);
    if (_paramMap['name'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请输入姓名',
        '未输入姓名',
      );
      return;
    }
    if (_paramMap['itemId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择门店',
        '未选择门店',
      );
      return;
    }
    if (_paramMap['roomTypeId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择户型',
        '未选择户型',
      );
      return;
    }
    print(_paramMap);
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_YUYUEFANGYUAN_URL, _paramMap,
        (Response response) {
      lwUtils.showAlertDialog(context, '恭喜你', '预约成功，稍后管家会与你取得联系',
          callblack: () {
        Navigator.pop(context);
      });
    }, (ErrorModel error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('预约'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                child: Image.asset(
                  'assets/home/yuyue.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 40,
                child: Text('请填写个人真实信息，以便管家与你取得联系'),
                alignment: Alignment.center,
              ),
              Container(
                child: cellTFWidget('姓名',
                    rightPlaceHodler: '请输入姓名',
                    paraMap: _paramMap,
                    textfiledKey: 'name',
                    controller: _textEditingController_name),
              ),
              Container(
                child: cellTFWidget('手机号',
                    rightText: '',
                    paraMap: _paramMap,
                    rightPlaceHodler: _phonePlaceHodler,
                    textfiledKey: 'phone',
                    controller: _textEditingController_phone,),
              ),
              Container(
                height: 10,
                color: LWCOLOR.LWCOLOR_BACKGROUND,
              ),
              Container(
                  child: cellArrowWidget('选择门店',
                      rightText: _mendianText,
                      isHaveRightIcon: true,
                      callBackBlock: chooseProject)),
              Container(
                  child: cellArrowWidget('意向户型',
                      rightText: _huxingText,
                      isHaveRightIcon: true,
                      callBackBlock: choosehuXing)),
              Container(
                  child: cellArrowWidget('期望入住时间',
                      rightText: _wantTimeText,
                      isHaveRightIcon: true,
                      callBackBlock: chooseDate)),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                height: 40,
                child: lwFillButton(
                  '提交预约',
                  commitInfor,
                  radius: 6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

