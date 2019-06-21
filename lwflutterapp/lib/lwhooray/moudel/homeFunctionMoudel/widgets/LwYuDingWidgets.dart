import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseDeatilWidget.dart';
import 'package:path/path.dart';

/// 确认提交 -- 费用信息
Widget commitRoomInforWidget(
  BuildContext context,
  String dianfei,
  String shuifei,
  String yajin,
) {
  List _leftList = [
    '电费',
    '水费',
    '押金',
  ];
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget('费用信息'),
          ),
          Container(
            child: cellArrowWidget(
              _leftList[0],
              rightText: dianfei??'' + '元/度',
              isHaveRightIcon: false,
            ),
          ),
          Container(
            child: cellArrowWidget(
              _leftList[1],
              rightText: shuifei??'' + '元/吨',
              isHaveRightIcon: false,
            ),
          ),
          Container(
            child: cellArrowWidget(
              _leftList[2],
              rightText: yajin??'' + '元',
              isHaveRightIcon: false,
            ),
          ),
        ],
      ),
    ),
  );
}

/// 确认提交 -- 提示信息
Widget commitTipsWidget() {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget('温馨提示'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: lwDescTitle(
                '   1.在您阅读完毕并确认本提示后，您须按操作流程支付定金，支付成功后将为您锁定并生成房源订单。 \n  2.您须在房源订单生成后的7日内完成签约，您已支付的定金将自动抵扣您本次签约房源的应付首笔支付款项。\n  3.如您在缴纳定金后的7日内因个人原因无法完成签约，将视为您放弃本次签约，房源将自动解除锁定，您已支付的定金将不再退还；如因客观原因导致房屋无法正常签约且无法协商，好寓将取消本次预订并全额退还您已支付的定金。',
                textcolor: Colors.black,
                fontsize: 13,
                maxline: 15,
                height: 1.2),
          ),
        ],
      )),
    ),
  );
}

/// 租约信息--房间信息 widget
Widget zuyueInforTopWidget(
  BuildContext context,
  String houseItemName,
  String donghao,
  String rent, {
  Function callBack,
  Map para,
  List<TextEditingController> controllers,
}) {
  List _leftList = [
    '月租',
    '定金',
    '*入住日期',
    '*预计签约时间',
  ];
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: houseInforTitleWidget('房间信息'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
            child: Text(houseItemName ?? ''),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
            child: Text(donghao ?? ''),
          ),
          Container(
            child: cellArrowWidget(
              _leftList[0],
              rightText: rent ?? '',
              isHaveRightIcon: false,
            ),
          ),
          Container(
            child: cellArrowWidget(
              _leftList[1],
              rightText: '1000元',
              isHaveRightIcon: false,
            ),
          ),
          Container(
              child: cellTFWidget(_leftList[2],
                  rightPlaceHodler: '请选择入住时间',
                  // rightText: ruzhusj ?? '',
                  controller: controllers[0],
                  enabled: false, callBackBlock: () {
            print('--------点击了入住时间');
            if (callBack != null) {
              callBack(1);
            }
          })),
          Container(
              child: cellTFWidget(_leftList[3],
                  rightPlaceHodler: '请选择预计签约时间',
                  // rightText: qianyuesj ?? '',
                  controller: controllers[1],
                  enabled: false, callBackBlock: () {
            if (callBack != null) {
              callBack(2);
            }
          })),
        ],
      ),
    ),
  );
}

///
Widget xiyiwidget(
  BuildContext context,
  bool isAgreeBool,
  Function callblack,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Image.asset(
                  'assets/house/' + ((isAgreeBool) ? 'xiyi_s.png' : 'xiyi_n.png')),
              iconSize: 10,
              onPressed: callblack,
            ),
          ),
          Container(
            child: Text(
              '勾选此项表示认同',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          Container(
            child: GestureDetector(
              child: Text(
                '《好寓公寓预定协议》',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              onTap: () {
                print('**lw************************点击了协议');
              },
            ),
          ),
        ],
      ),
    ),
  );
}

/// 租约信息--个人信息 widget
Widget zuyueInforPersonWidger(BuildContext context,
    {Map para, List<TextEditingController> controllers,bool nametfbool = true,bool phonetfbool = true}) {
  List _leftList = [
    '*姓名',
    '*手机号',
  ];
  List _placeHodler = ['请输入姓名', '请输入手机号'];
  List _keys = ['zukeName', 'zukePhone'];
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget('个人信息'),
          ),
          Container(
              child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _leftList.length,
            itemBuilder: (BuildContext conntext, int index) {
              return Container(
                  child: cellTFWidget(
                _leftList[index],
                rightPlaceHodler: _placeHodler[index],
                controller: controllers[index],
                paraMap: para,
                textfiledKey: _keys[index],
                enabled: nametfbool,
                inputType: (index == 0)? TextInputType.text : TextInputType.number,
                maxlenght: (index == 0)? 10 : 11,
              ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
              );
            },
          )),
        ],
      ),
    ),
  );
}

/// 底部按钮 （上一步，下一步）,
/// btnTextList:按钮的文字list
Widget getBottomBtnWidget(BuildContext context, List<String> btnTextList,
    {Function callBackBlock}) {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: btnTextList.map((v) {
          return Container(
            height: 30,
            width: (MediaQuery.of(context).size.width -
                    (btnTextList.length + 1) * 20) /
                btnTextList.length,
            child: lwFillButton(
              v ?? '',
              () => callBackBlock(v),
              borderColor: Colors.red,
              textcolor: Colors.red,
              backColor: Colors.white,
              radius: 4,
            ),
          );
        }).toList(),
      ));
}

/// 选房 房间信��
Widget getChooseHouseRoomInforWidget(BuildContext context, String hx, String mj,
    String cx, String zj, List<Map<String, String>> datas) {
  return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Card(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                child:
                    lwDescTitle('房间信息', textcolor: Colors.black, fontsize: 13),
              ),
              Divider(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Container(
                  child: Text(hx ?? ''),
                  color: Colors.orange,
                ),
              ),
              getSmallWidget('面积: ' + mj ?? '' + '㎡'),
              getSmallWidget('朝向: ' + cx ?? ''),
              getSmallWidget('实际租金: ' + zj + '元/月'),
              JiuGongGeForIconTextWidget(context, datas),
            ],
          ),
        ),
      ));
}

Widget getSmallWidget(String text) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
    child: Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 13),
    ),
  );
}
