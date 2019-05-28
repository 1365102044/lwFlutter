import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/loginMoudel/widgets/LwLoginWidget.dart';

class LwLoginPage extends StatefulWidget {
  @override
  _LwLoginPageState createState() => _LwLoginPageState();
}

class _LwLoginPageState extends State<LwLoginPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
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
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: '登录',
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('登录'),
          ),
          body: SingleChildScrollView(
            child: GestureDetector(
              child: Container(
              color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Center(
                    child: Image.asset('assets/me/me_logo.png',width: 160,height: 80,),
                  ),
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: lwTextField(_phoneController, '手机号',inputFormatters: [LengthLimitingTextInputFormatter(11),],keyboardType:TextInputType.number),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: lwTextField(_pwController, '密码'),
                ),
                Container(
                  height: 40,
                  width: 250,
                  child: lwFillButton('登录',
                     () {
                      print('--------点击了登录');
                      print('-------------${_phoneController.text}');
                      print('-------------${_pwController.text}');
                    },
                  ),
                ),
              ],
            ),
          ),
          onTap: (){

          },
            )
          )
        ));
  }
}
