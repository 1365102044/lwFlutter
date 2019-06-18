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
  String _ruzhusj;
  String _qianyuesj;
  @override
  void initState() {
    super.initState();
    _callBackBlock = widget.callBackBlock;
    _roomInforModel = widget.roomInforModel;
  }

  /// 选择日期
  _chooseDate(
    int index,
  ) {
    lwUtils.lwShowDetePicker(context, onChanged: (date) {
      print('-------------onchanged:$date');
    }, onConfirm: (date) {
      print('------------------onConfirm:$date');
      setState(() {
        if (index == 1) {
          _paramMap['endtime'] = date;
          _ruzhusj = date;
        } else {
          _paramMap['signTime'] = date;
          _qianyuesj = date;
        }
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
                          _roomInforModel.result.houseItemName,
                          _roomInforModel.result.louNo +
                              '栋' +
                              _roomInforModel.result.fangNo +
                              '号',
                          _roomInforModel.result.iosRent+'元/月',
                          _ruzhusj,
                          _qianyuesj, callBack: (index) {
                        _chooseDate(
                          index,
                        );
                      });
                    } else if (index == 1) {
                      return zuyueInforPersonWidger(context, _paramMap);
                    } else {
                      return xiyiwidget(context);
                    }
                  },
                ),
              ),
            ),
            Container(
              child: getBottomBtnWidget(context, ['上一步', '下一步'],
                  callBackBlock: (text) {
                _callBackBlock((text == '下一步') ? 2 : 1, _paramMap);
                print('**lw**33*********_paramMap*************');
                print(_paramMap);
                print('*************_paramMap***********lw**');
              }),
            )
          ],
        ),
      ),
    );
  }
}
