import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/loginMoudel/widgets/LwLoginWidget.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/loginModel.dart';

class LwLoginPage extends StatefulWidget {
  @override
  _LwLoginPageState createState() => _LwLoginPageState();
}

class _LwLoginPageState extends State<LwLoginPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  FocusNode _contextpwFocusNode = FocusNode();
  FocusNode _contextphoneFocusNode = FocusNode();
  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _phoneController.text = '18801040890';
    _pwController.text = '123456';
  }

  /// 登录请求
  void loginRequest() async {
    Map<String, String> para = {
      'phone': _phoneController.text != null ? _phoneController.text : '',
      'passWord': _pwController.text != null ? _pwController.text : '',
    };
    print('------para:${para.toString()}');
    LwNetworkUtils.requestDataWithPost(LWAPI.LOGIN_POSSWORD_URL, para,
        (Response response) {
      LwLoginResponse lwresponse = LwLoginResponse.fromJson(response.data);
      if (lwresponse != null && lwresponse.status.code == '200') {
        if (lwresponse.result != null) {
          lwLocalDataUtils.saveAccountInforWithLogin(lwresponse.result);
          Navigator.pop(context);
        }
      } else {
        lwUtils.showAlertDialog(
            context,
            '登录失败',
            (lwresponse != null && lwresponse.status != null)
                ? lwresponse.status.msg
                : '未知错误',);
      }
    }, (ErrorModel error) {
      lwUtils.showAlertDialog(context, '登录失败', error.msg,);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: '登录',
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: lwAppBar('登录'),
            body: SingleChildScrollView(
                child: GestureDetector(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Center(
                        child: Image.asset(
                          'assets/me/me_logo.png',
                          width: 160,
                          height: 80,
                        ),
                      ),
                      height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: lwTextField(
                        _phoneController,
                        '手机号',
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        keyboardType: TextInputType.number,
                        contentFocusNode: _contextphoneFocusNode,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child: lwTextField(
                        _pwController,
                        '密码',
                        contentFocusNode: _contextpwFocusNode,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 250,
                      child: lwFillButton(
                        '登录',
                        () {
                          _contextphoneFocusNode.unfocus();
                          _contextpwFocusNode.unfocus();
                          loginRequest();
                        },
                        radius: 6,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                
                
                
                // bool isl = await lwLocalDataUtils().isLoginStatue(context);
                
                // print('*************${isl.toString()}');

                _contextphoneFocusNode.unfocus();
                _contextpwFocusNode.unfocus();
                // FocusScope.of(context).requestFocus(FocusNode());
              },
            ))));
  }
}
