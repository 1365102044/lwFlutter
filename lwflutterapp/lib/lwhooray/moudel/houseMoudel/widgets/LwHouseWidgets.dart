import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/LwHousePage.dart';

Widget houseColumsItemWidget(BuildContext context, String picurl, String title,
    String desc, String price) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          child: lwImageWithNetWork(picurl,customfit:BoxFit.fitWidth),
        ),
        Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        alignment: Alignment.topLeft,
                        child: lwTitle(
                          title,
                          fontsize: 15,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        alignment: Alignment.topLeft,
                        child: lwTextRightIconLeftWidget(
                            context, desc, 'assets/house/location_icon.jpg'),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                color: Colors.red,
                height: 20.0,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  price + '元/每月起',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget lwTextRightIconLeftWidget(
    BuildContext context, String text, String iconName,
    {double iconW = 16.0,
    double iconH = 16.0,
    double fontsize: 12,
    textcolor: Colors.grey,
    int maxlines = 1}) {
  return Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
        child: Image.asset(iconName),
        height: iconH,
        width: iconW,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Text(
          text ?? '',
          style: TextStyle(
            fontSize: fontsize,
            color: textcolor,
          ),
          maxLines: maxlines,
          overflow: TextOverflow.clip,
        ),
      ),
    ],
  );
}

/// 房源列表底部的筛选条
Widget houseTopWidget(BuildContext context, String quyuText, String timeText,
    {double angle1 = 0.5,
    double angle2 = 0.5,
    Color timeTextColor = Colors.grey,
    GlobalKey anchorKey,
    double clearBtnWidth = 0,
    Function callBlackBlock(int)}) {
  return Container(
    color: Colors.white,
    height: 40,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            key: anchorKey,
            child: lwTextLeftIconRightWidget(
              context,
              quyuText,
              'assets/house/arrowbottom.png',
              () {
                callBlackBlock(1);
              },
              iconH: 22.0,
              iconW: 22.0,
              fontsize: 16,
              angle: angle1,
            ),
          ),
          flex: 3,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: lwTextLeftIconRightWidget(
                context, '价格', 'assets/house/arrowbottom.png', () {
              callBlackBlock(2);
            }, iconH: 22.0, iconW: 22.0, fontsize: 16.0, angle: angle2),
          ),
          flex: 3,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              callBlackBlock(3);
            },
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(timeText ?? '',
                          style: TextStyle(
                            color: timeTextColor,
                          )),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        width: clearBtnWidth,
                        height: 20,
                        child: lwFillButton('清空', () {
                          lwHouseTopNotification('msg').dispatch(context);
                        },
                            borderWidth: 1,
                            borderColor: Colors.grey,
                            backColor: Colors.white,
                            textcolor: Colors.grey,
                            radius: 4),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          flex: 4,
        ),
      ],
    ),
  );
}
