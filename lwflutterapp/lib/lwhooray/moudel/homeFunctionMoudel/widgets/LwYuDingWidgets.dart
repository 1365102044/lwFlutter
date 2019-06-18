import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHouseDeatilWidget.dart';
import 'package:path/path.dart';

/// 租约信息--房间信息 widget
Widget zuyueInforTopWidget(
  BuildContext context,
  String houseItemName,
  String donghao,
  String rent,
  String ruzhusj,
  String qianyuesj, {
  Function callBack,
  Map para,
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
            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
            child: Text(houseItemName ?? ''),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
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
                  rightText: ruzhusj ?? '',
                  enabled: false, callBackBlock: () {
            print('--------点击了入住时间');
            if (callBack != null) {
              callBack(1);
            }
          })),
          Container(
              child: cellTFWidget(_leftList[3],
                  rightPlaceHodler: '请选择预计签约时间',
                  rightText: qianyuesj ?? '',
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
) {
  bool isSelect = false;
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
                  'assets/house/' + ((isSelect) ? 'xiyi_n.png' : 'xiyi_s.png')),
              iconSize: 10,
              onPressed: () {
                isSelect = !isSelect;
              },
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
Widget zuyueInforPersonWidger(BuildContext context, Map para) {
  List _leftList = [
    '*姓名',
    '*手机号',
  ];
  List _placeHodler = ['请输入姓名', '请输入手机号'];
  List _keys = ['name', 'phone'];
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget('房间信息'),
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
                paraMap: para,
                textfiledKey: _keys[index],
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

/// 选房 房间信息
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
