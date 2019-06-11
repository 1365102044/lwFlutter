import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/lwProjectsInforModel.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class lwYuYuePage extends StatefulWidget {
  @override
  _lwYuYuePageState createState() => _lwYuYuePageState();
}

class _lwYuYuePageState extends State<lwYuYuePage> {
  TextEditingController _textEditingController_phone =
      new TextEditingController();
  TextEditingController _textEditingController_name =
      new TextEditingController();
  Map<String, String> _paramMap = {};
  String _accountphone = '';
  List<ListModel>_projectList = [];
  @override
  void initState() {
    super.initState();
    getPhone();
    getProjectInfor();
  }

  getProjectInfor() async{
    
    LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_PROJECT_LIST_INFOR_BY_CITYID_URL, {'cityId':'d94bba14-dec1-11e5-bcc3-00163e1c066c'}, (Response response){
      
    lwProjectsInforModel res = lwProjectsInforModel.fromJson(jsonDecode(response.data));
    _projectList.addAll(res.result.list);
    print('++++++++');
    print(_projectList);
    
    }, (ErrorModel error){
      print('+++++++++error:${error.descption()}');
    });
  }
  getPhone() async {
    String phone = await lwLocalDataUtils.getData(
      ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY,
    );

    setState(() {
      _textEditingController_phone.text = phone;
      print('------------_accountphone:$_accountphone');
    });
  }
  
  /// 选择门店
  chooseProject(){
    List<String>datasProjectName = [];
    _projectList.forEach((v){
      datasProjectName.add(v.houseItemName);
    });
    lwShowAlertList(context, '选择门店', datasProjectName,callBlackBlock: (int index){
      print('----------index:$index');
    });
  }

  /// 选择户型


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
                child: cellWidget('姓名',
                    rightPlaceHodler: '请输入姓名',
                    isHaveRightIcon: false,
                    paraMap: _paramMap,
                    textfiledKey: 'name',
                    controller: _textEditingController_name),
              ),
              Container(
                child: cellWidget('手机号',
                    rightText: '',
                    isHaveRightIcon: false,
                    paraMap: _paramMap,
                    textfiledKey: 'phone',
                    controller: _textEditingController_phone),
              ),
              Container(
                height: 10,
                color: LWCOLOR.LWCOLOR_BACKGROUND,
              ),
              Container(
                  child: cellArrowWidget('选择门店',
                      rightText: '请选择门店',
                      isHaveRightIcon: true,
                      callBackBlock: chooseProject)),
              Container(
                  child: cellArrowWidget('意向户型',
                      rightText: '选择户型',
                      isHaveRightIcon: true,
                      callBackBlock: () {})),
              Container(
                  child: cellArrowWidget('期望入住时间',
                      rightText: '选择时间',
                      isHaveRightIcon: true,
                      callBackBlock: () {})),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                height: 40,
                child: lwFillButton(
                  '提交预约',
                  (){},
                  radius:6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget cellWidget(String leftText,
    {String rightText,
    String rightPlaceHodler,
    bool isHaveRightIcon,
    String textfiledKey,
    Map<String, String> paraMap,
    bool enabled,
    TextEditingController controller,
    Function callBackBlock}) {
  return GestureDetector(
    child: Container(
      color: Colors.white,
      height: 50,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    leftText,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      counterText: rightText,
                      hintText: rightPlaceHodler,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    ),
                    onChanged: (text) {
                      paraMap[textfiledKey] = text;
                    },
                    enabled: enabled,
                  ),
                ),
                Container(
                  width: isHaveRightIcon ? 22 : 0,
                  height: isHaveRightIcon ? 22 : 0,
                  child: Image.asset('assets/home/arrow_right.png'),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    ),
    onTap: callBackBlock,
  );
}
