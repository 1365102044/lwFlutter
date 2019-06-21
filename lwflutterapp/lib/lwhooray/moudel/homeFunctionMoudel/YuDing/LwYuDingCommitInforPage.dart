import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/widgets/LwYuDingWidgets.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class LwYuDingCommitInforPage extends StatefulWidget {
  Map paraMap;
  Function callBackBlock;
  LwYuDingCommitInforPage(this.paraMap, this.callBackBlock);
  @override
  _LwYuDingCommitInforPageState createState() =>
      _LwYuDingCommitInforPageState();
}

class _LwYuDingCommitInforPageState extends State<LwYuDingCommitInforPage> {
  Map _paraMap;
  Function _callBackBlock;
  List<TextEditingController> _roominforControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> _personControllers;
  @override
  void initState() {
    super.initState();
    _callBackBlock = widget.callBackBlock;
    _paraMap = widget.paraMap;
    _personControllers = [
      TextEditingController(text: _paraMap['zukeName']),
      TextEditingController(text: _paraMap['zukePhone']),
    ];
    DateTime yuji = DateTime.parse(_paraMap['signTime']);
    String yujiendtime =
        yuji.add(Duration(days: 7)).toString().split(' ').first;
    String endtimestr = _paraMap['signTime'] + '——' + yujiendtime;
    _roominforControllers = [
      TextEditingController(text: _paraMap['endtime']),
      TextEditingController(text: endtimestr),
    ];
  }

_commitYuDingInfor(){
  _paraMap['isJizhong'] = '1';
  _paraMap['bookInAdvance'] = '1';
  _paraMap['money'] = '1000';
  LwNetworkUtils.requestDataWithPost(LWAPI.HOUSE_YUDINGFANGYUAN_URL, _paraMap, (Response response){

  }, (ErrorModel error){});
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LWCOLOR.LWCOLOR_BACKGROUND,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: zuyueInforTopWidget(
                          context,
                          _paraMap['houseItemName'],
                          _paraMap['loudong'],
                          _paraMap['rent'] + '元',
                          controllers: _roominforControllers,
                        ),
                      ),
                      Container(
                        child: zuyueInforPersonWidger(
                          context,
                          controllers: _personControllers,
                          nametfbool: false,
                        ),
                      ),
                      Container(
                        child: commitRoomInforWidget(
                            context,
                            _paraMap['dianfei'],
                            _paraMap['shuifei'],
                            _paraMap['yajin']),
                      ),
                      Container(
                        child: commitTipsWidget(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: getBottomBtnWidget(context, ['上一步', '确认预定'],
                  callBackBlock: (text) {
                _callBackBlock(
                  (text == '确认预定') ? 3 : 1,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
