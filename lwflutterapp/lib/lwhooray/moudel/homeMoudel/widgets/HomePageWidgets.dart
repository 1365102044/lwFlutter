import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/LwMapFindHousePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/lwYuYuePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/LwHousePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/LwHuXingListPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/lwHouseDeatilPage.dart';
import 'dart:math' as math;

import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/lwHuXingDeatilPage.dart';

Widget HomeColumsItemWidget(BuildContext context, List<dynamic> modelList) {
  String topdesc = '只生活，不漂泊，你值得一寓';
  String toptitle = '好寓精选';
  double hei = 190.0;
  // String picurl = roomList[index].roomTypePic.big;
  if ((modelList.first.runtimeType == RoomTypeListModel)) {
    topdesc = '房子可以租，生活不将就';
    toptitle = '热门户型';
    hei = 210.0;
  }
  dynamic model;
  if (modelList != null && modelList.length > 0) {
    model = modelList.first;
  }
  return Column(
    children: <Widget>[
      Container(
        color: Colors.white,
        child: HomeItemTopWidget(context, toptitle, topdesc, () {
          if (model.runtimeType == RoomTypeListModel) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LwHuXingListPage(modelList),
            ));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LwHousePage(modelList),
            ));
          }
        }),
      ),
      Container(
        color: Colors.white,
        height: hei,
        child: ListView.builder(
          itemCount: modelList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (model.runtimeType == RoomTypeListModel) {
              return HomeRowItemWidget(
                  context,
                  modelList[index].roomTypePic.big,
                  modelList[index].itemName,
                  modelList[index].roomTypeName, callBackBlock: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      lwHuXingDeatilPage(modelList[index].roomTypeId),
                ));
              });
            } else if (model.runtimeType == ItemListModel) {
              return HomeRowItemWidget(context, modelList[index].itemPic.big,
                  modelList[index].itemName, '', callBackBlock: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      LwHouseDeatilPage(modelList[index].itemId),
                ));
              });
            } else {
              return Container(
                height: 0.0,
              );
            }
          },
        ),
      )
    ],
  );
}

Widget HomeRowItemWidget(
    BuildContext context, String picurl, String title, String desc,
    {Function callBackBlock}) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 230.0,
              height: 150.0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    image: DecorationImage(
                      image: NetworkImage(picurl),
                      fit: BoxFit.cover,
                    )),
              )),
          Container(
            child: lwDescTitle(title, fontsize: 14, maxline: 1),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          ),
          Container(
            child: lwDescTitle(desc, fontsize: 12, maxline: 1),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            height: (desc == '') ? 0 : 20.0,
          ),
        ],
      ),
    ),
    onTap: callBackBlock,
  );
}

/// home item 上部
Widget HomeItemTopWidget(
  BuildContext context,
  String title,
  String descTitle,
  Function callBack,
) {
  return Row(
    children: <Widget>[
      Expanded(
          child: Column(
        children: <Widget>[
          Container(
            child: lwTitle(title),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          ),
          Container(
            child: lwDescTitle(descTitle),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
        ],
      )),
      Container(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: lwTextLeftIconRightWidget(
            context, '查看更多', 'assets/home/arrow_right.png', callBack),
      )
    ],
  );
}

/// 首页中的功能条
Widget HomeFuncItemsWidget(BuildContext context, {Function callBlackBlock}) {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          child: lwIconTopTextBottomWidget(
              context, '地图找房', 'assets/home/dituzhaofang.png',
              callBlackBlock: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LwMapFindHousePage(),));
              }),
        ),
        Expanded(
          child: lwIconTopTextBottomWidget(
              context, '预约看房', 'assets/home/yuyuekanfang.png',
              callBlackBlock: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => lwYuYuePage(),
            ));
          }),
        ),
        Expanded(
          child: lwIconTopTextBottomWidget(
              context, '预定房源', 'assets/home/yudingfangyuan.png',
              callBlackBlock: () {
            print('-----------点击了预定房源-----------');
          }),
        ),
        Expanded(
          child: lwIconTopTextBottomWidget(
              context, '签约房源', 'assets/home/zaixianqianyue.png',
              callBlackBlock: () {
            print('-----------点击了签约房源-----------');
          }),
        ),
        Expanded(
          child: lwIconTopTextBottomWidget(
              context, '购物商城', 'assets/home/jingdongshangcheng.png',
              callBlackBlock: () {
            print('-----------点击了购物商城-----------');
          }),
        ),
      ],
    ),
  );
}

void handleCallBlackBlock(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => lwYuYuePage(),
  ));
}

/// 文字在下图片在上组件
Widget lwIconTopTextBottomWidget(
    BuildContext context, String text, String iconName,
    {double iconW = 30.0,
    double iconH = 30.0,
    double fontsize = 15.0,
    textcolor: Colors.black,
    Function callBlackBlock}) {
  return Container(
    child: GestureDetector(
      onTap: callBlackBlock,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: iconW,
              height: iconH,
              // padding: EdgeInsets.fromLTRB(2, 10, 2, 5),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              // color: Colors.grey,
              child: Center(
                child: Image.asset(iconName),
              ),
            ),
            Container(
              // padding: EdgeInsets.fromLTRB(2, 0, 2, 5),
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: fontsize,
                    color: textcolor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget lwTextLeftIconRightWidget(
  BuildContext context,
  String text,
  String iconName,
  Function callBack, {
  iconW = 15.0,
  iconH = 15.0,
  double fontsize = 15,
  double angle = 0.5,
}) {
  return GestureDetector(
    onTap: callBack,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
            child: Text(
              text ?? '',
              style: TextStyle(fontSize: fontsize),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
              child: Transform.rotate(
                  angle: math.pi / angle,
                  child: Container(
                    width: iconW,
                    height: iconH,
                    child: Image.asset(iconName),
                  )))
        ],
      ),
    ),
  );
}

/// 标题
Widget lwTitle(String text,
    {Color textcolor: Colors.black, double fontsize: 17.0}) {
  return Text(
    text,
    style: TextStyle(
      color: textcolor,
      fontSize: fontsize,
      fontWeight: FontWeight.w400,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

/// 副标题
Widget lwDescTitle(String text,
    {Color textcolor: Colors.grey, double fontsize: 14.0, int maxline: 2}) {
  return Text(
    text,
    maxLines: maxline,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: textcolor,
      fontSize: fontsize,
    ),
    textAlign: TextAlign.left,
  );
}

Widget homeLeadingBtn(BuildContext context, String text,
    {Function callBlackBlock}) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 5),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
      color: Colors.red,
      child: Container(
        height: 150,
        width: 100,
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ),
    onTap: callBlackBlock,
  );
}
